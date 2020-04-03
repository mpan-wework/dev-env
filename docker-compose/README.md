# docker-compose

## Start

~~~bash
docker-compose up
~~~

or

~~~bash
docker-compose up redis mysql8
~~~

## Test

### redis

~~~bash
brew install redis
redis-cli -h 127.0.0.1 -p 56379
ping
set test haha
get test
expire test 5
get test # repeat for 5s
set test haha ex 5
get test # repeat for 5s
exit
~~~

### mysql

~~~bash
brew install mysql-client@5.7 # mysql-client for 8.0
alias mysql5=/usr/local/opt/mysql-client@5.7/bin/mysql # mysql-client for 8.0
mysql5 -h 127.0.0.1 -P 53305 -u root -p # mysql -h 127.0.0.1 -P 53308 -u root -p
[pa55w0rd]
show databases;
create database test;
show databases;
use test;
show tables;
create table tmp (c1 int);
show tables;
insert into tmp values (1);
select * from tmp;
drop database test;
show databases;
exit
~~~

### postgres

~~~bash
brew install libpq
alias psql=/usr/local/opt/libpq/bin/psql
psql postgres://mike:pa55w0rd@127.0.0.1:55432
\l
create database test;
\c test;
\dt
create table tmp (c1 int);
\dt
insert into tmp values (1);
select * from tmp;
\c postgres;
drop database test;
\l
exit
~~~

### rabbitmq

Visit http://localhost:55674/ and run `ruby /bunny-client/send_and_receive.rb`
