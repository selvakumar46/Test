--------------------------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE PRI
START WITH 1 INCREMENT BY 1;

CREATE TABLE USER_KFC(USER_ID NUMBER DEFAULT PRI.NEXTVAL  ,
                        USER_NAME VARCHAR2(100)NOT NULL,MAIL_ID VARCHAR2(100)NOT NULL UNIQUE,
                        MOBILE_NUMBER NUMBER NOT NULL UNIQUE,PRIMARY KEY(USER_ID));
                        
alter table user_kfc add role_type varchar2(20) default 'User';
DESC USER_KFC;
update products_kfc set product_price=469 where product_id=63;
SELECT *FROM USER_KFC;
update user_kfc set role_type='Admin' where user_id=106;
--select * from user_kfc where mail_id='hari@gmail.com'and mobile_number=1234567898;
--update  user_kfc set user_name='Vinoth' where user_id=2; 
--delete user_kfc where user_id=2;
--insert into  user_kfc values(2,'Vinoth','vkaathi@gmail.com',1234567893);
select * from user_kfc where mail_id= 'sri@gmail.com' and mobile_number=0;

--------------------------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE PRO
START WITH 1 INCREMENT BY 1;

CREATE TABLE PRODUCTS_KFC(PRODUCT_ID NUMBER DEFAULT PRO.NEXTVAL PRIMARY KEY,PRODUCT_NAME VARCHAR2(100)NOT NULL,
                            DESCRIPTION VARCHAR2(100)NOT NULL,PRODUCT_PRICE NUMBER NOT NULL,PRODUCT_TYPE VARCHAR2(100)NOT NULL,
                            PRODUCT_STATUS VARCHAR2(100)NOT NULL);
                            
                            
DESC PRODUCTS_KFC;
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('Stay Home Bucket','Enjoy 4pc of crispty and more',749,'non-veg','Available');
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('Family Feast','chicken, Medium Popcorn and 1 btle pepsi',789,'non-veg','Availabe');
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('5pc Smoky Red','Red Grilled Chicken',429,'non-veg','Sold Out');
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('Super Snacker Combo','med Popcorn,4 Strips,1 chilled Pepsi',429,'non-veg','Available');
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('Classic Zinger Meal','Zinger Burger,Medium fries,1 chilled Pepsi',319,'non-veg','Sold Out');
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('2 Classic Veg Krispers','delicious veg Value Burgers',138,'veg','Available');
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('Veg-Non-Veg Krispers Combo','2 veg ,2 Non-veg burgers',349,'non-veg','Available');
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('Pepsi ','330ml Can',60,'veg','Available');
INSERT INTO PRODUCTS_KFC (PRODUCT_NAME,DESCRIPTION,PRODUCT_PRICE,PRODUCT_TYPE,PRODUCT_STATUS)VALUES('Red Bull','Energy Drink',160,'veg','Available');

update  products_kfc set catogory='Trending Meals' where product_id=4;
select * from products_kfc where product_status='Available';
alter table products_kfc add catogory varchar2(100) ;
Alter table products_kfc add product_img varchar2(300);
select * from products_kfc where product_name='Red Bull';
alter table products_kfc drop column product_img;
commit;

select * from products_kfc where product_status='Available';
update products_kfc set product_img='E:\Project\ProjectKFC\src\main\webapp\image\StayHomeBucket.jpg' where product_id=1;
select * from products_kfc;

--------------------------------------------------------------------------------------------------------------------------------
CREATE SEQUENCE ORD
START WITH 1 INCREMENT BY 1;

CREATE TABLE ORDER_KFC(CART_ID NUMBER DEFAULT ORD.NEXTVAL PRIMARY KEY,PRODUCT_ID NUMBER NOT NULL,USER_ID NUMBER NOT NULL,QUANTITY NUMBER ,TOTAL_PRICE NUMBER(8,2),
                        FOREIGN KEY (PRODUCT_ID)REFERENCES PRODUCTS_KFC(PRODUCT_ID),
                        FOREIGN KEY (USER_ID) REFERENCES USER_KFC (USER_ID));
                        
DESCRIBE ORDER_KFC;
select * from order_kfc;
select * from products_kfc where product_name='Pepsi ';
delete  from user_kfc where user_id=22;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------


create table admin_kfc (amin_name varchar2(100) not null,mail_id varchar2(100)unique not null,mobile_number number(10)unique not null);

insert into admin_kfc values('Selva','selvakumar@gmail.com',7339232720);
DELETE FROM admin_kfc;

select * from admin_kfc;
--------------------------------------------------------------------------------------------------------------------------------
create sequence ord_item
start with 1 increment by 1;

create table invoice_kfc(invoice_id number default ord_item.nextval primary key,user_id number,total_price number(8,2),
                       delivery_adress varchar2(200) ,order_date date default sysdate);
select * from invoice_kfc;
alter table invoice_kfc drop column Quantity;
insert into invoice_kfc (user_id,total_price,delivery_adress) values (106,1458,'Chennai');
--------------------------------------------------------------------------------------------------------------------------------
desc invoice_kfc;
drop table order_items_kfc;
select * from cart_items_kfc;
select * from order_kfc where user_id=24;
select * from order_kfc where user_id=70;
update order_kfc set Quantity=9 where user_id=81;
update order_kfc set Quantity=3, total_price=500  where user_id=24 and product_id=8;
--------------------------------------------------------------------------------------------------------------------------------
create sequence cart_id
start with 1 increment by 1;
create table cart_items (cart_id number default cart_id.nextval primary key,product_id number,user_id number,product_name varchar2(100),quantity number,
                        total_Price number ,status varchar2(100) default 'Ordered',order_date date default sysdate,
                        foreign key (product_id)references products_kfc(product_id),
                        foreign key (user_id)references user_kfc(user_id));
                        
desc cart_items;
select * from cart_items where status='Ordered';

update  cart_items  set status='delevered' where user_id=24;
select * from cart_items where status='Ordered';
commit;
-------------------------------------------------------------------------------------------------------------------------------
create sequence payment
start with 1 increment by 1;

create table payments_kfc(transaction_id number default payment.nextval primary key,
user_id number,
card_number number,
card_type varchar2(100),
upi_id varchar2(100),
transaction_date date default sysdate,
foreign key(user_id)references user_kfc (user_id));


--------------------------------------------------------------------------------------------------------------------------------
select * from cart_items where user_id=24;
select * from cart_items where  order_date ='28-12-2021';
select pr.product_name,pr.product_price,ord.quantity,ord.total_price from products_kfc pr inner join order_kfc ord on ord.product_id=pr.product_id where user_id=126;
select pr.product_name,ord.quantity,ord.total_price,pr.product_id from products_kfc pr inner join order_kfc ord on ord.product_id=pr.product_id where user_id=126;
select * from cart_items where status='Ordered' and user_id=126;
---------------------------------------------------------------------------------------------------------------------------------
select * from USER_KFC;
select * from PRODUCTS_KFC;
select * from order_kfc;
select * from INVOICE_KFC;
select * from cart_items where cart_id=128;
select * from cart_items ;
select* from payments_kfc;
select * from admin_kfc;
drop table admin_kfc;
select * from cart_items where user_id=102 and  to_char(order_date,'dd-MM-yyyy')='06-01-2022' ;
select sum(total_price ) as totalPrice from cart_items where to_char(order_date,'dd-MM-yyyy')='07-01-2022' and user_id=3 ;
select sum(total_price) as totalPrice from order_kfc where user_id=24;
select * from invoice_kfc where user_id=106 order by(invoice_id) desc;
select * from invoice_kfc where user_id=106 order by(invoice_id) desc;
delete  from invoice_kfc ;

commit;
update cart_items set status='delevered' where user_id=3 and to_char(order_date,'dd-MM-yyyy')='07-01-2022';
select * from products_kfc where catogory='Trending' and product_status='Available';

select * from cart_items where user_id=126 order by(order_date) desc;
select * from user_kfc where mobile_number=9787689246;
select * from user_kfc where mail_id= 'selvaganesankgs@gmail.com';  