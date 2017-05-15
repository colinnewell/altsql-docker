The idea is to check out Alt-MySQL and drop these files in it's base directory.
Then you can spin up a couple of containers to run it with, a database server
and a machine with all the perl dependencies installed.  The current folder
with the module in is mounted into the container so you can continue editing
the code on your machine and testing it within the container.

```
git clone https://github.com/ewaters/altsql-shell.git
cd altsql-shell
# drop the docker-compose.yml file into this folder.
docker-compose run devmachine
perl -I lib bin/altsql -d test -h mysql -p -u dev
```

If you need the root password for mysql you can get it by looking at the
MySQL server logs.

```
docker logs altsqlshell_mysql_1 2>&1 | grep "ROOT PASSWORD"
```

Note that you ideally want the uid in the docker file to match your own. Run
`id` to see your own uid.

Docker images are been created automatically from this repo on quay.io.

```
docker pull quay.io/colinnewell/altsql-shell-developer # all the deps plus a dev user.
docker pull quay.io/colinnewell/altsql-shell-core # base image with just the dependencies
```

Of course you might want some data in your databases to try out the tool.  You
can download some sample MySQL databases like this,

```
wget http://downloads.mysql.com/docs/world.sql.gz

zcat world.sql.gz | docker exec -i altsqlshell_mysql_1 mysql -uroot -p$(docker logs altsqlshell_mysql_1 2>&1 | grep "ROOT PASSWORD" | cut -f4 -d' ')
docker exec -i altsqlshell_mysql_1 mysql -uroot -p$(docker logs altsqlshell_mysql_1 2>&1 | grep "ROOT PASSWORD" | cut -f4 -d' ') -e "grant all on world.* to 'dev'@'%';"
```

Another database you might want to play with is

```
wget http://downloads.mysql.com/docs/sakila-db.tar.gz
```

The same databases can be found on the
https://dev.mysql.com/doc/index-other.html page under the Example Databases
heading.
