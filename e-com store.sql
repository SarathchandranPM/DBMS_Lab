show databases;
create database if not exists ecom_store;
use ecom_store;
create table if not exists supplier(
supp_id int unsigned primary key, 
supp_name varchar(30) not null, 
supp_city varchar(30) not null,
supp_phone varchar(20) not null
);

create table if not exists customer(
cust_id int unsigned primary key,
cust_name varchar (30) not null,
cust_phone varchar (20) not null,
cust_email varchar (30) not null unique,
cust_city varchar (20) not null,
cust_gender enum('m', 'f','o')
);


create table if not exists category(
cat_id int unsigned primary key,
cat_name varchar (30) not null,
parent_cat_id int unsigned
);

alter table category add foreign key (parent_cat_id) references category (cat_id);

create table if not exists product(
id int unsigned primary key,
name varchar(20) not null default "dummy",
`desc` varchar (20) not null,
cat_id int unsigned not null,
foreign key (cat_id) references category(cat_id) 
);

alter table product rename column id to prod_id;

alter table product modify `desc` varchar(70);


create table if not exists supplier_pricing(
pricing_id int unsigned primary key,
pro_id int unsigned not null,
supp_id int unsigned not null,
price int default 0 ,
foreign key (pro_id) references product(id),
foreign key (supp_id) references supplier(supp_id)
);

create table if not exists `order`(
id int unsigned not null primary key,
amount int not null,
`date` date not null,
cust_id int unsigned not null,
pricing_id int unsigned,
foreign key (cust_id) references customer(cust_id),
foreign key (pricing_id) references supplier_pricing(pricing_id)
);

alter table `order` rename column `date` to order_date;

create table if not exists rating(
rating_id int unsigned not null primary key,
order_id int unsigned,
stars int not null,
foreign key (order_id) references `order`(id)
);

INSERT INTO supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"Akash@gmail.com","DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"Aman@gmail.com","NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"neha@gmail.com","MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"megha@gmail.com","KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"pulkit@gmail.com","LUCKNOW",'M');

INSERT INTO category VALUES(1,"BOOKS",2);
INSERT INTO category VALUES(2,"GAMES",4);
INSERT INTO category VALUES(3,"GROCERIES",5);
INSERT INTO category VALUES (4,"ELECTRONICS",1);
INSERT INTO category VALUES(5,"CLOTHES",3);

INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `order` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `order` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `order` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `order` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `order` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `order` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `order` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `order` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `order` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `order` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `order` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `order` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `order` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `order` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `order` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `order` VALUES(116,99,"2021-09-17",2,14);

alter table `order` rename column id to order_id;

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

/* Query 3 */

select count(t2.cust_gender) as NoOfCustomers, t2.cust_gender from (select t1.cust_id,t1.cust_gender, t1.amount, t1.cust_name from (select `order`.*,customer.cust_gender,customer.cust_name from `order` inner join customer where `order`.cust_id=customer.cust_id having `order`.amount>=3000) as t1 group by t1.cust_id) as t2 group by t2.cust_gender;

/* Query 4 */

select * from customer  inner join (select * from product inner join(select * from (select order_id, pro_id, cust_id  from `order` inner join supplier_pricing on `order`.pricing_id=supplier_pricing.pricing_id) as t6 where cust_id=2) as t1 on t1.pro_id=product.prod_id) as t2 on customer.cust_id= t2.cust_id; 

/* Query 5 */

select supplier.* from supplier where supplier.supp_id in (select supp_id from supplier_pricing group by supp_id having count(supp_id)>1);

/* query 6 */

select category.cat_name, tb2.* from (select cat_id, name, pro_id, min(price) as least_from_the_category from (select product.cat_id,product.name, t1.* from product inner join (select pro_id, min(price) as price from supplier_pricing group by pro_id) as t1 on product.prod_id=t1.pro_id order by cat_id) as tb1 group by cat_id order by cat_id) as tb2 inner join category on tb2.cat_id= category.cat_id;

/* query 7 */

select prod_id, `name` from product where prod_id in(select pro_id from supplier_pricing where pricing_id in (select pricing_id from `order` where order_date> '2021-10-05'));

/* query 8 */

select cust_name, cust_gender from customer where cust_name like 'A%' or cust_name like '%A';

/* query 9 */

select *,
case 
when stars=5 then 'Excellent service'
when stars>=4 then 'Good service'
when stars>=2 then 'Average service'
else 'Poor service'
end as 'Type of service'
from (select t3.order_id,t3.supp_id, t3.supp_name, rating.stars from rating inner join(select `order`.order_id, t2.* from `order` inner join(select supplier.supp_name, t1.* from supplier inner join(select pricing_id, supp_id from supplier_pricing) as t1 on supplier.supp_id=t1.supp_id) as t2 on `order`.pricing_id= t2.pricing_id) as t3 on rating.order_id=t3.order_id) as t4;

call `E-com`;