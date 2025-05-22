use itheima;

insert into t_user (id, name, sex, grade) VALUES (10001,'蔡徐坤','男',5);

desc t_user;
select * from t_user;
insert into t_user VALUES (10001,'丁真珍珠','男',8);
insert into t_user (id, name, sex, grade) VALUES ('10003','瑞克五代','男',5),('10004','芙蓉王源','男',5),('10005','鸡你太美','男',5),('10006','扎西德勒','男',5);

update t_user set name='姜萍',sex='女' where id=10001;
update t_user set grade=9;

delete from t_user where sex='女';

select database();

select * from t_niuma;
desc t_niuma;
insert into t_niuma values
(10001,'徐璐','8',20,'西安','2020-04-30'),
(10002,'严莉莉','8',19,'南京','2020-04-29'),
(10003,'王丽丽','8',19,'长沙','2020-04-28'),
(10004,'王丽丽','8',19,'西安','2020-04-27'),
(10005,'郭靖','8',19,'武汉','2020-05-01'),
(10006,'张三','8',19,'南京','2020-05-02'),
(10007,'李四','8',19,'北京','2020-05-03'),
(10008,'王五','8',19,'上海','2020-05-04'),
(10009,'赵六','8',19,'广州','2020-05-05'),
(10010,'孙七','8',19,'深圳','2020-05-06');

select * from t_niuma;
select id, name, grade, age, addr from t_niuma;
select * from t_niuma where addr='西安';
select addr from t_niuma;
select t_niuma.addr as '家庭地址' from t_niuma;
select t_niuma.addr as '家庭地址' from t_niuma;
select distinct t_niuma.addr '家庭地址' from t_niuma;
select * from t_niuma where age=19&&addr='西安';
select * from t_niuma where age>=19&&t_niuma.age<=22;
select * from t_niuma where age between 20 and 22;
select * from t_niuma where age in(19,20,44)&& t_niuma.addr in('西安','南京');
select * from t_niuma where age between 20 and 22;

select * from t_niuma where name like '__';
select * from t_niuma where t_niuma.addr like '%京';

select count(*) from t_niuma;
select count(name)  from t_niuma;

select avg(t_niuma.age) from t_niuma;
select max(t_niuma.age) from  t_niuma;
select min(t_niuma.age) from  t_niuma;
select sum(t_niuma.age) from t_niuma where addr='西安';

alter table t_niuma drop number;
alter table t_niuma change ident_id addr varchar(10);

select * from t_niuma;
alter table t_niuma add gender varchar(1);
insert into t_niuma (gender) values ('女'),('男'),('女'),('男'),('女'),('男'),('女'),('男'),('女'),('男') where id between 10001 and 10010;
update t_niuma set gender='女' where id between 10001 and 10005;
update t_niuma set gender='男' where id between 10006 and 10010;
delete  from t_niuma where t_niuma.gender='男';

select gender '性别', count(*) '计数' from t_niuma group by gender;
select t_niuma.gender,avg(t_niuma.age) from t_niuma group by gender;
select addr,count(*) from t_niuma where age=19 group by addr having count(*)=2;

select * from t_niuma order by in_work asc ;
select name from t_niuma order by in_work desc ;
select * from t_niuma order by in_work,age;

select * from t_niuma limit  0,4;
select * from t_niuma limit  4,4;
select * from t_niuma limit  8,4;

select * from t_niuma where gender='女' && age in(19,20,21);
select * from t_niuma where gender='男' && age between 18 and 22 && name like '__';
select gender,count(*) from t_niuma where age<20 group by gender;
select t_niuma.name,t_niuma.age,t_niuma.in_work from t_niuma where age<21 order by age,in_work desc;
select * from t_niuma where gender='男' && t_niuma.age between 19 and 21 order by age,in_work desc limit 3;
select * from t_niuma where gender='男' && t_niuma.age between 19 and 21 order by age,in_work desc limit 3,3;

# select 属性1,属性2... count(*) from table_name whrer 条件1&& 条件2... order by ... limit ...;
# DQL语句的执行顺序： from                  语法顺序： select
#                  where                          from
#                  group by                       where
#                  having                         group by
#                  select                         having
#                  order by                       order by
#                  limit                          limit

show databases;
use mysql;
show tables ;
select * from user;
# insert into user
create user niuma@'localhost' identified by '123456';
alter user niuma@'localhost' identified with mysql_native_password by 'zyb.2015';
drop user niuma@'localhost';

show grants for niuma@'localhost';
show databases ;
grant all on itheima.* to niuma@'localhost';
grant all on wdnmd.* to niuma@'localhost';
revoke all on wdnmd.* from niuma@'localhost';

select upper('Hello World'); #转换为大写
select lower('Hello World'); #转换为小写
select concat('hello','world'); #字符串连接
select lpad('hello',8,'l');
select rpad('hello',8,'r');
select  trim(' hello world ');
select substring('hello world',3,5);

show databases ;
select * from itheima.t_niuma;
use itheima;
update t_niuma set id=lpad(id,7,0);

select ceil(1.2);
select floor(1.2);
select rand();
select  round(1.335,2);
select lpad(ceil(rand()*1000000),6,'0');  #生成随机6为验证码

select current_date();
select current_time();
select now();
select year('1998-02-18');
select month('1998-02-18');
select  day('1998-02-18');
select date_add('1998-02-18',interval 20 month );
select date_add('12:02:39',interval 39 second );
select datediff('1998-02-18','1997-09-26');

select * from t_niuma;
select name AS '姓名',datediff(now(),in_work) AS '入职天数' from t_niuma order by 入职天数 desc  ;

select if(true,'yes','error');
select ifnull('notnull','null');
select ifnull(null,'null');
select ifnull('','null');

select case when true then 'true' else 'error' end ;
select case when false then 'true' else 'error' end;
select case 'true' when 'true' then 'true' else 'false' end;
select case 'truee' when 'true' then 'true' else 'false' end;

select t_niuma.name,(case addr when '北京' then '一线城市' else '二线城市' end) AS '城市'
from t_niuma;

select * from t_user;
alter table t_user add age tinyint comment '年龄';
insert into t_user(t_user.age) values (18),(22),(25),(20);
delete from t_user where age in(18,22,25,20);
update t_user set t_user.age=18 where id=10003;
update t_user set t_user.age=20 where id=10004;
update t_user set t_user.age=22 where id=10005;
update t_user set t_user.age=28 where id=10006;

alter table t_user add  score tinyint comment '成绩';
update t_user set score=99 where id=10003;
update t_user set score=88 where id=10004;
update t_user set score=77 where id=10005;
update t_user set score=66 where id=10006;

select t_user.name,case  when t_user.score>85 then '优秀' when t_user.score between 60 and 85 then '良好' when t_user.score<60 then '不及格' end as '评级' from t_user

show tables ;
create table t_student(
    id int primary key auto_increment comment 'id',
    name varchar(10) not null unique comment '姓名',
    gender varchar(1) comment '性别',
    age tinyint check (age between 18 and 70),
    status varchar(1) default '1'
);
select * from t_student;
alter table t_student modify age tinyint check ( age between 0 and 100);

insert into t_student (name, gender, age, status) values ('张三','男',18,'1');
insert into t_student (name, gender, age, status) values ('李四','女',22,'0');
insert into t_student (name, gender, age, status) values ('李四','男',25,'1');
insert into t_student (name, gender, age, status) values ('王五','男',30,'0');
insert into t_student (name, gender, age, status) values ('赵六','男',110,'1');
insert into t_student (name, gender, age) values ('赵六','女',29);

create table t_emp(
    id int primary key auto_increment comment 'id',
    name varchar(10) not null unique comment '姓名',
    gender varchar(1) comment '性别',
    age tinyint check (age between 18 and 70),
    part_id tinyint check(part_id between 1 and 4) comment '部门' # 1:销售部 2:市场部 3:技术部 4:运营部
);
select *
from t_emp;
create table t_part(
    id tinyint primary key auto_increment comment 'id',
    name varchar(10) not null unique comment '部门名称'
);
select * from t_part;
insert into t_emp (name, gender, age, part_id) values ('张三','男',18,1);
insert into t_emp (name, gender, age, part_id) values ('李四','女',22,2);
insert into t_emp (name, gender, age, part_id) values ('王五','男',25,3);
insert into t_emp (name, gender, age, part_id) values ('赵六','男',30,4);
insert into t_emp (name, gender, age, part_id) values ('钱七','男',35,1);
insert into t_emp (name, gender, age, part_id) values ('孙八','男',40,2);

insert into t_part(name) values ('销售部'),('市场部'),('技术部'),('运营部');

alter table t_emp add constraint part_for_key foreign key (part_id) references t_part(id);

delete from t_part where name='运营部'; #删除失败 存在子表 保证的数据一致性

#外键 删除更新约束
#执行失败 外间约束不支持修改
alter table t_emp add constraint part_for_key foreign key (part_id) references t_part(id) on update no action  on delete no action ;
#正确做法 删除原有外间 重新定义
alter table t_emp drop foreign key part_for_key;
alter table t_emp add constraint part_for_key foreign key (part_id) references t_part(id) on update cascade on delete cascade ;
alter table t_emp add constraint part_id_fk foreign key (part_id) references  t_part(id) on update cascade  on delete cascade;
alter table t_emp drop  foreign key part_id_fk;
alter table t_emp add constraint part_id_fk foreign key (part_id) references  t_part(id) on update cascade on delete set null ;
# 外间约束限制
# no action cascade set null
#对于添加check的字段 无法添加外间约束
alter table t_emp drop check t_emp_chk_2;
delete from t_part where id=1;
select * from t_emp;
show create table t_emp;

