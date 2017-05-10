The idea is to check out Alt-MySQL and drop these files in it's base directory.  Then you can spin up a couple of containers to run it with, a database server and a machine with all the perl dependencies installed.  The current folder with the module in is mounted into the container so you can continue editing the code on your machine and testing it within the container.

```
git clone https://github.com/ewaters/altsql-shell.git
cd altsql-shell
# drop the docker files into this folder.
docker-compose run devmachine
perl -I lib bin/altsql -d test -h mysql -p -u dev
```

If you need the root password for mysql you can get it by looking at the MySQL server logs.

```
docker logs altsqlshell_mysql_1 2>&1 | grep "ROOT PASSWORD"
```

Note that you ideally want the uid in the docker file to match your own. Run id to see your own uid.


