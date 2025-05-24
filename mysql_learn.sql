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
