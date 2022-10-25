drop table if exists t42;
go
create table t42(c1 int primary key, c2 varchar(32));
go
insert into t42 values(1, 'Project 07');
insert into t42 values(2, 'Project 42');
go
select * from t42
go
