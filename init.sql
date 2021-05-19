# /\_/\
#     ____/ o o \
#   /~____  =-= /
#  (______)__m_m)
#创建数据库
create database ContactSystem;

use ContactSystem;
#创建用户联系人表
create table user
(
    id      int(20) primary key not null auto_increment,
    name    varchar(32)         not null,
    gender  varchar(32)         not null,
    age     int(20)             not null,
    address varchar(32)         not null,
    qq      varchar(32)         not null,
    email   varchar(32)         not null
) engine = innodb
  default charset = utf8;
# 插入测试数据
insert into user (id, name, gender, age, address, qq, email)
values (null, '小红', '女', 18, '北京市', '23486468', '23486468@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小蓝', '女', 19, '上海市', '57286468', '57286468@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小白', '女', 18, '天津市', '46486468', '46486468@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小绿', '男', 18, '河北省', '415648', '415648@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小黄', '男', 18, '湖北省', '23486468', '23486468@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小陈', '男', 18, '湖南省', '86433468', '86433468@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小江', '女', 18, '福建省', '6435343', '6435343@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小王', '女', 18, '陕西省', '4156341', '4156341@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小庄', '男', 18, '四川省', '1864315', '1864315@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小文', '女', 18, '广西壮族自治区', '48764', '48764@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小静', '女', 18, '台湾省', '468435', '468435@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小飞', '男', 18, '辽宁省', '468745', '684125@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小开', '男', 18, '江西省', '3164843', '3164843@qq.com');

insert into user (id, name, gender, age, address, qq, email)
values (null, '小两', '女', 18, '重庆市', '64894', '64894@qq.com');

#创建管理员表
use ContactSystem;

create table manager
(
    id       int(20) primary key not null auto_increment,
    username varchar(32)         not null,
    password varchar(32)         not null
) engine = innodb,
  default charset = utf8;

insert into manager(id, username, password)
VALUES (1, 'root', '123456')
