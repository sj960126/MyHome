create table users(
userNum_pk number(20) not null,
userName varchar2(30),
userId varchar2(30),
userPw varchar2(30),
userEmail varchar2(50),
userPhone varchar2(30),
userAddr varchar2(30),
PRIMARY KEY(userId)
);

create table orderList(
orderCode_pk number(20) not null,
userName varchar2(30),
userId varchar2(30),
userEmail varchar2(50),
userPhone varchar2(30),
userAddr varchar2(30),
PRIMARY KEY(orderCode_pk)
);
alter table orderDetail add userName varchar2(30);
alter table orderDetail add userId varchar2(30);

create table orderDetail(
orderCode_fk number(20) not null,
price number(20),
productName varchar2(20),
category varchar2(20),
userName varchar2(30),
userId varchar2(30),
FOREIGN KEY (orderCode_fk) REFERENCES orderList(orderCode_pk)
on delete cascade
);

ALTER TABLE ORDERDETAIL
DROP COLUMN USERNAME;

ALTER TABLE ORDERDETAIL
DROP COLUMN USERID;


INSERT INTO orderList VALUES (seq_order_code.nextval, '������', '', '','','');

INSERT INTO orderDetail VALUES (1002, 0, '', '����', '', '');
INSERT INTO orderDetail VALUES (1002, 0, '', '�ֹ��ǰ', '', '');
INSERT INTO orderDetail VALUES (1002, 0, '', 'ħ�ǿ�ǰ', '', '');
INSERT INTO orderDetail VALUES (1002, 0, '', '����', '', '');

select * from review;

select *from orderList;
select *from orderDetail;

delete from orderlist where ordercode_pk = 24;
create table review(
userNum     VARCHAR2(20),
userName    varchar2(30),
Bcontent     varchar2(500),
Bday         date  
);

ALTER TABLE orderdetail
RENAME COLUMN category TO ocategory;


alter table boards rename to review;


create table board(
userName    varchar2(20),
title   varchar2(100),
content varchar2(1500)
);



select * from board;
delete from board where username ='qwe';


--ALTER TABLE users 
--ADD CONSTRAINT users_fk FOREIGN KEY (productCode_pk) 
--REFERENCES products(productCode_pk)
--on delete CASCADE;

create sequence seq_users_code
increment by 1
start with 1001;

create sequence seq_order_code
increment by 1
start with 1001;

INSERT INTO users VALUES (seq_users_code.nextval, 'ȫ�浿', 'asd', 'asd', 'asd@', '01000000000', '��û��');
INSERT INTO users VALUES (seq_users_code.nextval, 'ȫ���', 'qwe', 'qwe', 'qwe@', '01000001234', '��û��');
INSERT INTO users VALUES (seq_users_code.nextval, 'ȫ���', 'qwe20', 'qwe', 'qwe@', '01000001234', '������');

INSERT INTO users VALUES (seq_users_code.nextval, '������', 'admin', '0000', 'admin@', '01012341234', '��⵵');


INSERT INTO orderList VALUES (seq_order_code.nextval, '', '', '', '����');
INSERT INTO orderList VALUES (seq_order_code.nextval, '', '', '', '����');
INSERT INTO orderList VALUES (seq_order_code.nextval, '', '', '', '�ֹ��ǰ');
INSERT INTO orderList VALUES (seq_order_code.nextval, '', '', '', 'ħ�ǿ�ǰ');



drop table products;
delete from users;

drop table orderList;

drop sequence seq_order_code;
drop sequence seq_users_code;

select * from tab;
--SELECT u.userNum_pk, u.userId, u.userPw, u.userName,u.userEmail, u.userPhone, u.userAddr, u.orderCode_fk, u.productCode_fk
--FROM users u, orderList o, products p
--WHERE u.orderCode_fk = o.orderCode_pk
--AND u.productCode_fk = p.productCode_pk;


select * from users;
select * from orderList;
select * from boards;

commit;



SELECT count(*)
FROM orderList
WHERE category = '����';

delete from users where userid ='������';

SELECT userName, userId, userPw FROM users WHERE userId = '1405302903' AND userPw = '������';
