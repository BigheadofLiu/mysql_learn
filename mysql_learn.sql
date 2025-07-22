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
use mysql;Using where
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

#对于添加check的字段 无法添加外间约束
alter table t_emp drop check t_emp_chk_2;
delete from t_part where id=1;
select * from t_emp;
show create table t_emp;

#多表查询
#一对一 一对多 多对多
#一对多 多的一方作为子表建立外键 指向少的一方的主键
#一对一 多用于拆分表格 任意一方建立外键 指向另外一方主键（需要唯一）
#多对多 建立一张中间表 设置两个外键约束 分别指向双方主键

show create table t_student;
drop table t_student;
create table t_studet(
    id int unique auto_increment,
    t_id smallint primary key not null,
    name varchar(10)
);
alter table t_student drop t_id; #报错 不可以直接删除主键
drop table t_studet;
create table t_student(
    id smallint primary key auto_increment,
    name varchar(10)
);
insert into t_student (name) VALUES ('张三'),('李四'),('王五'),('赵六'),('钱七');
create table t_course(
    id smallint primary key auto_increment,
    name varchar(10)
);
insert into t_course(name) values ('语文'),('数学'),('英语'),('政治'),('历史'),('地理'),('物理'),('化学'),('生物');

create table studet_course(
    student_id smallint,
    course_id smallint
);
alter table  studet_course add constraint stu_fk foreign key(student_id) references t_student(id);
alter table studet_course add constraint cou_fk foreign key (course_id) references t_course(id);

insert into studet_course (student_id,course_id) values (1,1),(1,2),(1,3),(2,1),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9);
alter table  studet_course add id int primary key auto_increment;

#一对一  多用于拆分一张表 拆分为基础信息和详情信息
create table t_user_2
(
    id     int primary key auto_increment,
    name   varchar(10),
    gender varchar(1),
    phone  varchar(11)
);
create table t_user_2_detail(
    id int primary key auto_increment,
    user_id int unique,
    address varchar(100),
    degree varchar(10),
    major varchar(10)
);
insert into t_user_2 (name,gender,phone) values ('张三','男','12345678901'),('李四','女','12345678902'),('王五','男','12345678903');
insert into t_user_2_detail (user_id,address,degree,major) values (1,'北京','本科','计算机'),(2,'上海','硕士','软件'),(3,'广州','本科','网络');

alter table t_user_2_detail add constraint user_id_fk foreign key (user_id) references t_user_2(id);

select * from t_emp e ,t_part p; #笛卡尔积
select e.name,p.name from t_emp e,t_part p where e.part_id=p.id; # 隐式内连接
select e.name,p.name from t_emp e inner join t_part p on e.part_id=p.id; #显式内连接
select * from t_emp;
select * from t_part;
show create table t_part;
show create table t_emp;
SELECT DISTINCT part_id FROM t_emp;
SELECT * FROM t_part;


#外连接 左外连接 右外连接
select e.name,p.name from t_emp e left outer join t_part p on e.part_id=p.id;
select e.name,p.name from t_emp e right outer join t_part p on e.part_id=p.id;

#内连接 我查我自己？
select a.name '姓名',b.name '上级' from t_emp a,t_emp b where a.manager_id=b.id;
select a.name '姓名',b.name '上级' from t_emp a left outer join t_emp b on a.manager_id=b.id;

#union 将多个查询结果合并起来
#union （all） 带all参数不会去重  select查询的字段数量和类型要相同
select name from t_emp where age >30
union all
select name from t_emp where gender='男';

#select嵌套
#标量子查询
select id from t_part where name='财务部';
select name from t_emp where part_id=2;
#嵌套查询
select name from t_emp where part_id=(select t_part.id from t_part where t_part.name='财务部');

select name from t_emp where age>(select age from t_emp where name='李四');

#列子查询
select name from t_emp where id in(select id from t_part where t_part.name='技术部'|| t_part.name='财务部');
#all指全部 any（some）指任意一个
select t_emp.name from t_emp where age >any/*(all)*/(select age from t_emp where part_id =(select id from t_part where t_part.name='财务部'));

#行子查询
select  * from t_emp where id=(select t_part.id from t_part where t_part.name='技术部');
select t_emp.gender,t_emp.age from t_emp where name='王五' or name='文二';
select * from t_emp where (gender,age)in (select t_emp.gender,t_emp.age from t_emp where name='王五' or name='文二');
select * from t_emp where (gender,age)in (select t_emp.gender,t_emp.age from t_emp where name='王五' or name='文二');

#表子查询
#根据查询结果 再次查询
select * from t_emp where age<20;
select a.name,b.name from (select * from t_emp where age<20) a left join t_part b on a.part_id=b.id;

show databases ;
create database 多表查询练习;
use 多表查询练习;
create table t_emp(
    id int primary key auto_increment,
    name varchar(10),
    age smallint,
    gender varchar(1),
    salary int,
    part_id smallint,
    manager_id smallint,
    hiredate date comment '入职时间',
    constraint part_fk foreign key (part_id) references t_part(id)
);
alter table t_emp modify manager_id int;
alter table t_emp add constraint manager_fk foreign key (manager_id) references t_emp(id);
alter table t_emp drop constraint manager_fk;
create table t_part(
    id smallint primary key auto_increment,
    name varchar(10)
);
create table sallary_grade(
    id smallint primary key auto_increment,
    low int,
    high int
);
insert into t_emp(name,age,gender,salary,part_id,manager_id,hiredate)
values
('金庸',65,'男',30000,1,null,'1980-01-01'),
('张无忌',25,'男',10000,1,1,'1999-01-01'),
('韦小宝',18,'男',8000,2,1,'2005-01-01'),
('黄蓉',18,'女',9000,3,2,'2005-01-01'),
('郭靖',35,'男',11000,2,1,'2006-01-01'),
('黄药师',45,'男',12000,3,2,'2007-01-01'),
('欧阳锋',65,'男',18000,4,3,'2008-01-01'),
('梅超风',20,'女',7000,4,3,'2009-01-01'),
('张三丰',100,'男',25000,5,3,'2010-01-01'),
('灭绝师太',70,'女',23000,5,3,'2011-01-01'),
('丘处机',55,'男',20000,1,1,'2012-01-01');
insert into t_part(name) values ('总经办'),('技术部'),('销售部'),('财务部'),('人事部');
insert into sallary_grade(low,high) values (0,3000),(3000,5000),(5000,8000),(8000,10000),(10000,15000),(15000,20000),(20000,25000),(25000,30000);

#start
select a.name,a.age,a.gender,b.name from t_emp a,t_part b where a.part_id=b.id;
select a.name,a.age,a.gender,b.name from t_emp a,t_part b where a.part_id=b.id && a.age<30;
select distinct a.part_id,b.name from t_emp a,t_part b where a.part_id=b.id;
select a.*,b.name from t_emp a left outer join t_part b on a.part_id=b.id where a.age>40;
select a.name,a.salary, b.id,b.low,b.high  from t_emp a,sallary_grade b where a.salary between b.low and b.high;
select a.*,b.id,c.name from t_emp a,sallary_grade b,t_part c where (a.salary between b.low and b.high) and (a.part_id=c.id) and (c.name='技术部');
select avg(a.salary)  from t_emp a where a.part_id=(select b.id from t_part b where b.name='人事部');
#查询比灭绝工资高的员工信息
select t_emp.salary from t_emp where name='灭绝师太';
select * from t_emp a where  a.salary>(select salary from t_emp where name='灭绝师太');

select avg(salary) from t_emp;
select * from t_emp where salary>(select avg(salary) from t_emp);

select avg(a.salary) '平均薪资',b.name '部门' from t_emp a,t_part b where a.part_id=b.id && a.part_id=1;
select avg(a.salary) '平均薪资',b.name '部门' from t_emp a,t_part b where a.part_id=b.id && a.part_id=2;
select avg(a.salary) '平均薪资',b.name '部门' from t_emp a,t_part b where a.part_id=b.id && a.part_id=3;
select avg(a.salary) '平均薪资',b.name '部门' from t_emp a,t_part b where a.part_id=b.id && a.part_id=4;
select avg(a.salary) '平均薪资',b.name '部门' from t_emp a,t_part b where a.part_id=b.id && a.part_id=5;

select a1.name,a1.salary from t_emp a1 where a1.part_id=1 && a1.salary<(select avg(a.salary) from t_emp a,t_part b where a.part_id=b.id && a.part_id=1);
select a1.name,a1.salary from t_emp a1 where a1.part_id=2 && a1.salary<(select avg(a.salary) from t_emp a,t_part b where a.part_id=b.id && a.part_id=2);

select count(*) from t_emp where t_emp.part_id=1;
#查询每个部门的人数（有点没看懂）
select distinct a.part_id,b.name,(select count(*) from t_emp where t_emp.part_id=b.id) from t_emp a,t_part b where a.part_id=b.id;

use itheima;
select a.name,b.name from t_student a,t_course b, studet_course c where c.student_id=a.id && c.course_id=b.id;

#事务
create database 事务练习;
use 事务练习;
create table t_user(
    t_id tinyint primary key auto_increment,
    name varchar(10),
    money int
);
insert into t_user (name, money) VALUES ('张三',2000),('李四',2000);
select * from t_user;

update  t_user set money=2000 where name='张三';
update t_user set money=2000 where  name='李四';

#只减1000 没有执行加1000
update t_user set money=money-1000 where name='张三';

手动模拟异常...

update t_user set money=money+1000 where name='李四';

#查看事务提交方式
select @@autocommit; #默认为1 自动提交

set @@autocommit=0; #修改为手动提交
insert into t_user (name, money) VALUES ('张三',2000),('李四',2000);
select * from t_user;

update  t_user set money=2000 where name='张三';
update t_user set money=2000 where  name='李四';

#只减1000 没有执行加1000
update t_user set money=money-1000 where name='张三';

手动模拟异常...

update t_user set money=money+1000 where name='李四';

#手动提交
commit ;

#回滚操作
rollback ;

set @@autocommit=1;
#开启事务
start transaction ;
update t_user set money=money-1000 where name='张三';

手动模拟异常...

update t_user set money=money+1000 where name='李四';

commit; #如果没有报错 就执行commit

rollback ;# 如果有报错 就执行rollback

#事务隔离                  （误读、不可重复读、幻读）
#事务级别   read uncommitted  o o o
#          read committed    x o o
#    repeatable read(默认）   x x 0
#          serializable      x x x

select @@transaction_isolation;

show  create table 事务练习.t_user;
show engines ;
#数据库引擎
create database 数据库引擎;
use 数据库引擎;
create table user_innodb(
    id int primary key auto_increment,
    name varchar(10),
    age tinyint
)ENGINE =innodb;
create table user_MyISAM(
    id int primary key auto_increment,
    name varchar(10),
    age tinyint
)ENGINE =MyISAM;
create table user_memory(
    id int primary key auto_increment,
    name varchar(10),
    age tinyint
)ENGINE =memory;
show tables ;
#不同的数据库引擎有不同的应用场景；
show variables like 'innodb_file_per_table';
show variables like 'datadir';

#索引
#1.创建索引
create database 索引练习;
create table t_user(
    id int primary key auto_increment,
    name varchar(10),
    phone varchar(11),
    email varchar(20),
    major varchar(10),
    gender varchar(1),
    create_date date
);
insert into t_user(name,phone,email,major,gender,create_date)
VALUES
('芈月','12345678901','001@qq.com','土木工程','女','2020-01-01'),
('程咬金','12345678902','002@qq.com','学前教育','男','2022-05-01'),
('孙尚香','12345678903','003@qq.com','软件工程','女','2019-05-01'),
('诸葛亮','12345678904','004@qq.com','土木工程','男','2020-01-01'),
('妲己','12345678905','005@qq.com','学前教育','女','2022-05-01'),
('李白','12345678906','006@qq.com','软件工程','男','2019-05-01'),
('貂蝉','12345678907','007@qq.com','酒店管理','女','2020-01-01'),
('孙膑','12345678908','008@qq.com','工商管理','男','2022-05-01'),
('花木兰','12345678909','009@qq.com','土木工程','女','2019-05-01'),
('小乔','12345678910','010@qq.com','学前教育','女','2020-01-01');
select * from t_user;
#创建索引
show index from t_user;
use 索引练习;
create index idx_name on t_user(name);
create unique index idx_unique_email on t_user(email);
create index idx_name_major_gender on t_user(name,major,gender);
create index idx_phone on t_user(phone);
#删除索引
drop index idx_name on t_user;

#性能优化相关
show global status like 'Com_______';  # 查看各语句执行频次

#慢查询
show  variables like 'slow_query_log'; #默认为off 需要手动修改mysql配置文件后重启
SHOW VARIABLES LIKE 'long_query%'; #慢查询指标
show variables like 'slow_query_log_file'#慢查询log文件
#这里面几个坑 首先是配置文件my.cfd的位置 以及权限 以及内容格式很容易踩坑
#需修改文件路径：etc/mysql/my.cnf
#日志存储路径：/var/lib/mysql/localhost-slow.log

#profile 分析语句耗时
SELECT @@have_profiling;
select @@profiling;
set profiling =1;
set profiling =0;
select * from t_user;
select * from t_user where id=2;
select * from t_user where name='芈月';
select count(*) from t_user;
show profiles; # 当前终端级别
# show profile for query 199;
# SHOW PROFILE FOR QUERY 199; #指定参数
SHOW PROFILE all FOR QUERY 231;

#explain 查看语句的执行计划
explain select * from t_user;
explain select * from t_user where id=2;

use itheima;
show tables;
select * from t_student;
explain select * from t_student;
explain select a.name,b.name from t_student a,t_course b,studet_course c where a.id=c.student_id && b.id=c.course_id;
#查询选修语文的学生的所有信息
select id from t_course where name='语文';
select student_id from studet_course where course_id=1;
select * from t_student where id in(1,2,3);
explain select * from t_student where id in(select student_id from studet_course where course_id=(select id from t_course where name='语文'));
explain select 'a';

#添加索引 可以显著提升查询效率
#索引使用法则
#最左前缀法则
use 索引练习;
show tables ;
select * from t_user;
show index from t_user;
explain select * from t_user where email='004@qq.com';
explain select * from t_user a where a.name='花木兰' and a.major='土木工程' and a.gender='女'; #key_len 93
explain select * from t_user a where a.name='花木兰' and a.major='土木工程'; /*and a.gender='女';*/ #key_len 86
explain select * from t_user a where a.name='花木兰' /*and a.major='土木工程' and a.gender='女'*/; #key_len 43
explain select * from t_user a where a.name='花木兰' /*and a.major='土木工程'*/ and a.gender='女'; #key_len 43 失效情况
explain select * from t_user a where a.major='土木工程' and a.name='花木兰' and  a.gender='女'; #key_len 93 跟顺序无关
explain select * from t_user a where /*a.name='花木兰' and*/ /*a.major='土木工程' and*/ a.gender='女'; #不生效
#索引字段使用>或者<之后的字段索引会失效 （使用>= <=可避免）

#索引失效
#对索引字段进行运算操作 对于字符字段不加'' 后置%模糊匹配可以 %前置模糊匹配不行
desc t_user;
desc select * from t_user a where a.phone='12345678901'; #yes
explain  select * from t_user a where a.phone=12345678901; #no
create index idx_major on t_user(major);
explain select * from t_user a where a.major like '%工程'; #模糊匹配要用like no
explain select * from t_user a where a.major like '软件%';#yes

#对于or并列的字段都需要有索引才会全部使用索引  mysql自动评估（索引字段数是否小于常规查询）
show index from t_user;
desc t_user;
explain select * from t_user a where a.name='花木兰' or a.major='土木工程' or a.gender='女'; #no 每个字段需要有自己单独的索引
explain select * from t_user a where a.phone='12345678907' or a.major='土木工程' or a.email='004@qq.com'; #yes
explain select * from t_user a where a.name='花木兰'and a.phone='12345678907' or a.major='土木工程' or a.email='004@qq.com'; #yes
drop index idx_phone on t_user;
explain select * from t_user a where a.phone='12345678907' or a.major='土木工程' or a.email='004@qq.com'; #no

create index idx_phone on t_user(phone);
explain select * from t_user a where a.phone>'12345678901'; #no
explain select * from t_user a where a.phone>'12345678905'; #yes

#user index,ignore index,force index
show index from t_user;
create index idx_name on t_user(name);
explain select * from t_user where name='芈月';
explain select * from t_user use index(idx_name) where name='芈月';
explain select * from t_user use index(idx_name_major_gender) where name='芈月';
explain select * from t_user ignore index(idx_name) where name='芈月';
explain select * from t_user force index(idx_name_major_gender) where name='芈月';

#覆盖索引 加快查找速度
show index from t_user;
drop index idx_major on t_user;
drop index idx_name on t_user;

explain select * from t_user;
explain select name from t_user where name='芈月'; #Using index
explain select id from t_user where id='3'; #Using where
explain select major,gender from t_user where major='软件工程'; #Using where:Using where; Using index
show profiles;
explain select major,create_date from t_user where major='软件工程'; #Using where
#尽量不使用select * 对 待查询字段建立联合索引 提升查询速度 避免回表查询 直接覆盖索引
show profile all for query 35;

#前缀索引  体现在subpart字段
select * from t_user;
select count( distinct substring(email,1,2))/count(email)from t_user;
create index idx_eamil_1_2 on t_user(email(2));
show index from t_user;
drop index idx_unique_email on t_user;
explain select * from t_user where email='008@qq.com';

#单列索引与联合索引
drop index idx_name_major_gender on t_user;
create index idx_name on t_user(name);
explain select name,phone from t_user where name='貂蝉' and phone='12345678907'; # 两个单列索引只用到了一个
create index idx_name_phone on t_user(name,phone);
explain select name,phone from t_user use index(idx_name_phone) where name='貂蝉' and phone='12345678907'; #指定联合索引 覆盖索引 避免回表查询

 show databases ;
use sql优化;
show tables ;
show index from tb_user;
select * from tb_user;

use 索引练习;
select *
from t_user;
#insert优化 ：1.批量插入 2.手动提交事务 3.文件load导入
#主键优化：1.主键字段不要太长 2.尽量使用自增主键 3.主键顺序插入 尽量不要操作主键
#order by优化：对order by的字段建立索引（注意asc和desc） 避免 filesort 使用using index速度更快，
show index from t_user;
explain select name,phone from t_user order by name; #key:idx_name_phone
explain select email,major from t_user order by email,major; #Using filesort
create index idx_emial_major on t_user(email,major);
explain select email,major from t_user order by email,major; #Using index
explain select major,email from t_user order by email,major;# Using index; Using filesort 最左原则：索引失效
explain select email,major from t_user order by email asc,major desc ;#Using index; Using filesort 索引失效
create index idx_email_asc_major_desc on t_user(email asc,major desc );
explain select email,major from t_user order by email asc,major desc ;#Using index 索引有效
select @@sort_buffer_size; #262144

# group by 优化 同样是使用索引加快分组效率
desc select major,count(*) from t_user group by major; #Using temporary
show index from t_user;
drop index idx_emial_major on t_user;
drop index idx_email_asc_major_desc on t_user;
create index idx_major on t_user(major);
desc select major,count(*) from t_user group by major; #Using index
drop index idx_major on t_user;
create index idx_name_major on t_user(name,major);
desc select major,count(*) from t_user group by major; #索引失效 Using index; Using temporary
desc select major,count(*) from t_user where t_user.name='花木兰' group by major; #索引有效 where 和group by组合使用也满足索引最左原则

#limit优化 limit不能通过索引来优化 通过查询主键作为一个新表进行多表查询即可
use sql优化;
select * from tb_user limit 999910,10; #366 ms
select id from tb_user limit 999990,10;
select * from tb_user a,(select id from tb_user limit 999990,10) b where a.id=b.id; #169 ms

#count优化
#性能：count(主键）~count(字段名）< count（1）< count(*)

#update优化
#行锁，表锁 对建立索引的字段进行更新（行锁)，未建立索引字段（表锁） 尽量对建立索引的字段进行更新，避免升级为表锁
# update 字段名(这个字段建立索引) where 字段名条件

#视图
use itheima;
select * from t_user;
create view t_user_view_1 as select name,age from t_user;
show create view t_user_view_1;
select * from t_user_view_1;
create or replace view  t_user_view_1 as select name,age,score from t_user;
alter view t_user_view_1 as select name,age,score,sex from t_user;
drop view if exists t_user_view_1;

#约束条件 with (local/cascaded) check option
select * from t_user;
create or replace  view t_user_v as select id,name from t_user where id>=6 with local check option ;
select * from t_user_v;
#不加限制 任何数据都可以插入
insert into t_user_v values (5,'主=6');
insert into t_user_v values (6,'溜溜梅');

#加入local限制
create or replace  view t_user_v_2 as select id,name from t_user_v where id<=10 with local check option ;
select  * from t_user_v_2;
insert into t_user_v_2 values (5,'顶针珍珠'); #插入成功 但仍需满足上级视图的限制 能通过此视图插入原表 但是在此视图中不显示
insert into t_user_v_2 values (11,'肖战'); #插入失败
#cascade
create or replace view t_user_v_3 as select id,name from t_user_v where id<=10 with cascaded check option ;
select * from t_user_v_3;
insert into t_user_v_3 values (8,'芙蓉王源'); #插入成功
insert into t_user_v_3 values (5,'芙蓉王源'); #插入失败 满足t_user_v_3的where条件 不满足t_user_v的where条件
insert into t_user_v_3 values (11,'基尼太美'); #插入失败
#cascade和local的区别：
#local只检查目前视图的where条件不检查上级视图的where条件（如果上级加了check仍需满足，不加check则无需满足）
#cascade 无论上级试图where条件是否加了check都需要满足

#视图的更新（视图的行与基础表之间需要存在一对一的关系才可以完成更新）
#对于创建时带有 count sum max、group by、distinct、union（all）等不允许更新
create or replace view t_user_v_4 as select count(name) from t_user;
insert into t_user_v_4 values (1);  #插入失败：不存在一对一的关系

#视图的作用：1.简单 2.安全 3.数据独立
create view t_user_v_5 as select age from t_user where t_user.age>18; #可以用视图代替查询语句（比如多表联合查询）
#通过视图只能查询到满足视图条件的行
#屏蔽真实表结构带来的变化
#视图案例
create view t_user_v_name_age as select name,age from t_user;
select s.name student_name ,c.name course_name from t_student s,t_course c, studet_course sc where s.id=sc.student_id && c.id=sc.course_id;
create or replace view t_v_student_course as select s.name student_name ,c.name course_name from t_student s,t_course c, studet_course sc where s.id=sc.student_id && c.id=sc.course_id;
select * from t_v_student_course;

#存储过程
#若干条sql语句的集合
#创建存储过程
show databases;
select database();
create procedure p1()
begin
    select * from t_user;
end;
call p1();
#删除
drop procedure p1;
#如果是在命令框中写存储过程 需要把命令结束符;替换为其他符号
# mysql> delimiter $$
# mysql> create procedure p1()
#     -> begin
#     -> select * from t_user;
#     -> end$$
# Query OK, 0 rows affected (0.18 sec)
show create procedure p1; #查看存储过程创建语句
SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'itheima'; #查询指定数据库的存储过程

#系统变量
#查看系统变量                                                                      #
show global variables ;
show session variables ;
show global variables like 'auto%';
show session variables like 'auto%';
select  @@global.autocommit;
select @@session.autocommit;
#修改系统变量
set session autocommit =0;
#mysql 服务重启后 所有设置的系统变量会恢复默认设置 如果需要制定需要在my.cnf文件中设置参数

#自定义变量
set @my_color :='blue';
set @my_age=10;
set @my_grade=6,@name='瑞克五代';
#查看
select @my_color;
select @my_age,@my_grade,@name;
select count(*) into @my_count from t_user;
select  @my_count;
select  @my_no_define; #未定义赋值的变量初始值为null

#局部变量
#用于在存储过程中使用的变量
#语法：declare 变量名 变量类型 [default..]
use itheima;
create procedure p2()
begin
    declare my_local_count int default 0;
    select  count(*) into  my_local_count from t_user;
    select my_local_count;
end;
call  p2();

#if判断
create procedure p3()
begin
    declare score int default 60;
    declare leveal char;
    if score>85 then
        set leveal:='A';
    elseif score>60 then
        set leveal:='B';
    else
        set leveal='C';
    end if;
    select leveal;
end;
call p3();

#参数（in,out,inout）
create procedure p4(in score int,out level char)
begin
    if score>=85 then
        set level:='A';
    elseif score>=60 then
        set level:='B';
    else
        set level:='C';
    end if;
end;
call p4(88,@level);
#为什么需要select才刷新level的值
select @level;

create procedure p5(inout score double)
begin
    set score:=score*0.5;
end;
set @my_score:=198;
call p5(@my_score);
select @my_score;

#case
create procedure p6(in month int)
begin
   declare result varchar(10);
    case
        when month between 1 and 3 then
            set result='一季度';
        when month between 4 and 6 then
            set result='二季度';
        when month between 7 and 9 then
            set result='三季度';
        when month between  10 and 12 then
            set result='四季度';
        else
            set result='无效数据';
    end case ;
   select concat(month,'月份属于',result);
end;
call p6(16);

#循环while
#计算从1到n的值
create procedure p7(in sum int)
begin
    declare total int default 0;
    while sum>0 do
        set total:=total+sum;
        set sum:=sum-1;
    end while;
    select total;
end;
call p7(100);

#repeat
create procedure p8(in sum int)
begin
    declare total int default 0;
    repeat
        set total:=total+sum;
        set  sum:=sum-1;
    until sum<=0
    end repeat;
    select total;
end;
call p8(100);

#loop(leave,iterate)
create procedure p9(in sum int)
begin
    declare total int default 0;
    sum:loop
        if sum<=0 then
            leave sum;
        end if;
        if sum%2=1 then
            set sum=sum-1;
            iterate sum;   #如果是奇数跳过
        end if;
        set total=total+sum;
        set sum=sum-1;
    end loop;
    select total;
end;
call p9(100);

#cursor 相当于一个容器 用于存储查询数据到的多行数据
create procedure p10()
begin
    declare t_data int default 0;
    select count(*) into t_data from t_user;  #success
    select * into t_data from t_user; #the used SELECT statements have a different number of columns 不能使用一个普通变量接收
    select t_data;
end;
call p10();
#所以引入cousor
select name,score from t_user where age<22;
create procedure p11()
begin
    declare d_name varchar(20) default null;
    declare d_score tinyint default 0;
    declare t_data_c cursor for select name,score from t_user where age<22;
#     declare exit handler for 02000 close t_data_c;
    declare exit handler for not found close t_data_c;
    drop table if exists t_user_name_score;
    create table if not exists t_user_name_score(
        name varchar(20),
        score tinyint
    );
    open t_data_c;
    #没有设置跳出循环的条件 #条件处理程序 跳出循环
    while true do
    fetch t_data_c into d_name,d_score;
    insert into t_user_name_score values (d_name,d_score);
    end while;
    close t_data_c;
#     select * from t_user_name_score;
end;
call p11();

#存储函数
#所有的存储函数都可以被存储过程替代
create  function fun1(sum int)
returns int deterministic
begin
    declare total int default 0;
    while sum>0 do
        set total:=total+sum;
        set sum:=sum-1;
    end while;
    return total;
end;
select fun1(50);

#触发器
#目前只支持行级触发 不支持语句级触发
#类型：insert(new)、update(old\new)、delete(old)
create table t_niuma_logs(
  id int(11) not null auto_increment,
  operation varchar(20) not null comment '操作类型, insert/update/delete',
  operate_time datetime not null comment '操作时间',
  operate_id int(11) not null comment '操作的ID',
  operate_params varchar(500) comment '操作参数',
  primary key(`id`)
)engine=innodb default charset=utf8;

#创建触发器
    create  trigger t_niuma_trigger_insert before insert on t_niuma for each row
    begin
        insert into t_niuma_logs values (null,'insert',now(),NEW.id,concat('插入的内容为：id=',new.id,'|name=',new.name,'|grade=',new.grade,'|age=',new.age,'|addr=',new.addr,'|in_work=',new.in_work,'|gender',new.gender));
    end;

    create  trigger t_niuma_trigger_update before update on t_niuma for each row
    begin
        insert into t_niuma_logs values (null,'update',now(),NEW.id,concat('更新后内容为：id=',new.id,'|name=',new.name,'|grade=',new.grade,'|age=',new.age,'|addr=',new.addr,'|in_work=',new.in_work,'|gender',new.gender));
        insert into t_niuma_logs values (null,'update',now(),OLD.id,concat('更新前内容为：id=',old.id,'|name=',old.name,'|grade=',old.grade,'|age=',old.age,'|addr=',old.addr,'|in_work=',old.in_work,'|gender',old.gender));
    end;

    create trigger t_niuma_trigger_delete before delete on t_niuma for each row
    begin
        insert into t_niuma_logs values (null,'delete',now(),OLD.id,concat('删除的内容为：id=',old.id,'|name=',old.name,'|grade=',old.grade,'|age=',old.age,'|addr=',old.addr,'|in_work=',old.in_work,'|gender',old.gender));
    end;
#查看触发器
    show triggers;
#删除触发器
drop trigger t_niuma_trigger_insert;
drop trigger t_niuma_trigger_update;
#测试三种触发器
insert into t_niuma values ('0010011','大桥未久',9,22,'北京','2022-04-07','女');
update t_niuma set name='神木丽' where id='0010010';
delete from t_niuma where id='0010010';

#锁
#全局锁(所有表）、表锁（单个表）、行锁
#创建全局锁
flush tables with read lock ;
show databases ;
select * from t_niuma; #DQL语句可以执行
update t_niuma set name='神木丽' where id='0010010'; #执行失败
unlock tables ; #解除全局锁
# 执行备份(外部命令框执行)
# 备份时加上参数 –single-transaction 参数来完成不加锁的一致性数据备份。
#mysqldump --single-transaction -uroot -p123456 itcast > itcast.sql

# 表锁（表锁、元数据锁、意向锁）
#
# 表锁（共享读、独占写）
# 读锁不会阻塞其他客户端的读，但是会阻塞写。写锁既会阻塞其他客户端的读，又会阻塞其他客户端的写.
#读锁#(共享）
lock tables t_niuma read ;
select * from t_niuma; #可读
update t_niuma set name='本庄铃' where id='0010010'; #写失败
unlock tables ;
#写锁(独占）其他控制台任务只能等待
lock tables t_niuma write ;
select * from t_niuma; #可读
update t_niuma set name='桃乃木' where id='0010010'; #可写

#元数据锁 MDL
#MDL加锁由系统自动控制，访问同一张表会自动加上不同类型的元数据锁
#sql语句                                         锁类型                                 说明
# lock tables xxx read /write	                SHARED_READ_ONLY/SHARED_NO_READ_WRITE
# select 、 select … lock in share mode	        SHARED_READ	                          与SHARED_READ、SHARED_WRITE兼容，与EXCLUSIVE互斥
# insert 、update、delete、select …for update	SHARED_WRITE	                      与SHARED_READ、SHARED_WRITE兼容，与EXCLUSIVE互斥
# alter table …                              	EXCLYSIVE	                          与其他的MDL都互斥
# 查看自动生成的元数据锁
# select object_type,object_schema,object_name,lock_type,lock_duration from performance_schema.metadata_locks;
lock tables t_niuma read ;
lock tables t_niuma write;
unlock tables;
select object_type,object_schema,object_name,lock_type,lock_duration from performance_schema.metadata_locks;

select database();
set @@session.autocommit:=0;
select @@session.autocommit;
begin;
select * from t_niuma;  #TABLE,itheima,t_niuma,SHARED_READ,TRANSACTION
commit ;  #commit之后 share_read自动删除

begin;
insert into t_niuma values (0010012,'小岛南',8,19,'上海','2020-05-04','男'); #TABLE,itheima,t_niuma,SHARED_WRITE,TRANSACTION
commit;

begin;
alter table t_niuma add salary tinyint;   #为神马没有看到EXCLYSIVE状态
# alter table t_niuma drop salary;
commit;
select object_type,object_schema,object_name,lock_type,lock_duration from performance_schema.metadata_locks;

#意向锁
#用来解决表锁与行锁之间的冲突(减少表锁的检查次数，提升性能）
#意向共享锁 表级锁（IS） select ... lock in share mode
#意向互斥锁 表级锁（IX） insert、update、delete、select... for update
#共享锁 行级锁
#互斥锁 行级锁
#IS 和 IX是表级别锁、不会和行级别的S锁和X锁发生冲突、意向锁之间也不会发生冲突、会和共享表锁（lock table read）和、独占表锁(lock table lock)发生冲突
# 兼容关系
#     S       X      IS     IX
# S  兼容
# X 不兼容   不兼容
# IS 兼容    不兼容  兼容
# IX 兼容    不兼容  兼容    兼容

select @@autocommit;
set @@session.autocommit=0;
select version();

begin;
select  * from t_niuma where id='0010011' lock in share mode ;
commit ;
unlock tables ;
show index from t_niuma;
show create table t_niuma;

begin;
select  name,gender,in_work from t_niuma where id='0010011' for update ;
commit;

#查看行锁与表锁的相关信息
#1
SELECT
    engine_transaction_id AS trx_id,  -- 事务ID
    object_name AS table_name,        -- 表名
    index_name,                       -- 索引名（行锁涉及）
    lock_type,                        -- 锁类型（RECORD=行锁，TABLE=表锁）
    lock_mode,                        -- 锁模式（X,IX,S,IS等）
    lock_status,                      -- 锁状态（GRANTED=已获取，WAITING=等待）
    lock_data                         -- 锁定的数据（如主键值）
FROM performance_schema.data_locks;
#2
SELECT
  object_schema,
  object_name,
  index_name,
  lock_type,
  lock_mode,
  lock_data
FROM performance_schema.data_locks;
#3
# select object_schema,object_name,index_name,lock_type,lock_mode,lock_data
# from peformance_schema.data_locks

#相关语句及其对应锁的类型
# SQL	                        行锁类型	    表意向锁（自动附加）          说明
# insert，update，delete …	    排他锁（X）	IX                          自动加锁
# select	                    不加任何锁   无
# select … lock in share mode	共享锁（S）	IS                          需要手动select之后加上lock in share mode
# select … for update	        排他锁（X）	IX                          需要手动在select之后for update

alter table t_niuma modify id varchar(10) primary key;  #增加主键

# 针对唯一索引进行检索时，对已存在的记录进行等值匹配时，将会自动优化为行锁。
# InnoDB的行锁是针对于索引加的锁，不通过索引条件检索数据，那么InnoDB将对表中的所有记录加锁，此时 就会升级为表锁。



#间隙锁1
# (1)索引上的等值查询(唯一索引)，给不存在的记录加锁时,优化为间隙锁 。
# (2)索引上的等值查询(普通索引)，向右遍历时最后一个值不满足查询需求时，next-keylock退化为间隙锁。
# (3)索引上的范围查询(唯一索引)–会访问到不满足条件的第一个值为止。

#存在于可重复读级别
begin ;
commit ;
insert into t_niuma values ('0010018','波多野',8,18,'上海','2020-05-04','女',1500);
alter table t_niuma modify salary int;

# (1)
begin;
update t_niuma set name='天使萌' where id='0010015' for share ;  #更新不存在的字段
commit ;
# 锁情况 GAP间隙锁
# itheima,t_niuma,TABLE,IX,
# itheima,t_niuma,PRIMARY,RECORD,"X,GAP",'0010018'
# 间隙锁会导致其他事务的插入语句阻塞 直到间隙锁取消

# (2)
begin ;
select * from t_niuma where age=20 lock in share mode ;
commit ;
#锁情况
# itheima,t_niuma,,TABLE,IS,
# itheima,t_niuma,idx_age,RECORD,"S,GAP","22, '0010011'"
# itheima,t_niuma,idx_age,RECORD,S,"20, '0010001'"
# itheima,t_niuma,PRIMARY,RECORD,"S,REC_NOT_GAP",'0010001'

# (3)
begin ;
select * from t_niuma where id>='0010016' for share ;
# 锁情况
# itheima,t_niuma,,TABLE,IS,     #表级意向锁
# itheima,t_niuma,PRIMARY,RECORD,S,supremum pseudo-record    #无穷大锁
# itheima,t_niuma,PRIMARY,RECORD,S,'0010018'      #间隙锁
# itheima,t_niuma,PRIMARY,RECORD,"S,REC_NOT_GAP",'0010016'  #行锁

#innodb引擎
#看不懂 看了视频 略

#常用管理命令
# mysql +选项 +参数
# mysqladmin
# mysqlbinlog
# mysqlshow
# mysqldump
# mysqlimport/source  mysqlimport用于导入 dump -T备份的数据，source用于导入.sql文件

#运维篇暂时不看了。。。


















