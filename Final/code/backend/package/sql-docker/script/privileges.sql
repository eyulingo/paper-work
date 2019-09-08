use mysql;
select host, user from user;

create user 'docker'@'%' identified by '123456docker';

grant all on eyulingo_db.* to 'docker'@'%' identified by '123456docker' with grant option;
grant all on eyulingo_db.* to 'docker'@'47.103.15.32' identified by '123456docker' with grant option;
grant all on eyulingo_db.* to 'docker'@'localhost' identified by '123456docker' with grant option;


flush privileges;