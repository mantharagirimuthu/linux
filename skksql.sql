CREATE DATABASE db_shopon;USE db_shopon;
CREATE TABLE category (
categoryid int NOT NULL,
category varchar(20) DEFAULT NULL,
PRIMARY KEY (categoryid)
);INSERT INTO category VALUES (10001,'Smart Phone'),(10002,'IOS'),(10003,'Android'),(10004,'Windows');CREATE TABLE company (
companyid int NOT NULL,
companyname varchar(20) DEFAULT NULL,
PRIMARY KEY (companyid)
);INSERT INTO company VALUES (1001,'Samsung'),(1002,'Nokia'),(1003,'Motorolla'),(1004,'BlackBerry'),(1005,'iPhone');CREATE TABLE customer (
customerid int NOT NULL,
customername varchar(20) DEFAULT NULL,
mobileno varchar(10) DEFAULT NULL,
emailid text,
PRIMARY KEY (customerid)
);INSERT INTO customer VALUES (1,'Amrutha','9493611244','amruthamandala@gmail.com'),(2,'Goutham','7676484448','gouthamreddy@gmail.com'),(3,'Ravi','8956247897','ravikanth@gmail.com'),(4,'Kiranmai','789635241','kiranmai@gmail.com'),(5,'Ravi','9896345244','ravi@gmail.com'),(6,'Sandeep','9896374512','sandeep@gmail.com'),(7,'Rajesh','9493617895','rajesh@gmail.com'),(8,'Naresh','8963521478','naresh@gmail.com'),(9,'Manoj','9127896578','manoj@gmail.com'),(10,'Meghna','945936245','Meghna@gmail.com'),(11,'Mahesh','9127896578','Mahesh@gmail.com');CREATE TABLE customeraddress (
customerid int,
stName varchar(100),
city varchar(30),
state varchar(30),
CONSTRAINT fkcstid FOREIGN KEY (customerid) REFERENCES customer (customerid) ON delete cascade
);INSERT INTO customeraddress VALUES (1,'JP Nagar','Bangalore','Karnataka'),(2,'RT Nagar','Bangalore','Karnataka'),(3,'BG Road','Bangalore','Karnataka'),(4,'Marhthy Nagar','Durg','Chattisghad'),(5,'Amerpet','Hydrabad','AP'),(6,'Hudson Circle','Bangalore','Karnataka'),(7,'Sultanpet','Durg','Chattisghad'),(8,'Garibpet','Hydrabad','AP'),(9,'Sector 10','Bhailai','Chattisghad'),(10,'Sector 9','Bhailai','Chattisghad'),(11,'Maruthy Nagar','Bhailai','Chattisghad');CREATE TABLE orderd (
orderid int NOT NULL,
orderstatus varchar(20) DEFAULT NULL,
orderdate date DEFAULT NULL,
customerid int NOT NULL,
totalAmount float,
PRIMARY KEY (orderid),
CONSTRAINT pkcsid FOREIGN KEY (customerid) REFERENCES customer (customerid)
);INSERT INTO orderd VALUES (1,'New','2013-02-02',1,NULL),(2,'New','2013-02-03',1,NULL),(3,'New','2013-02-03',2,NULL),(4,'New','2013-02-03',2,NULL),(5,'New','2013-02-04',2,NULL),(6,'New','2013-02-04',3,NULL),(7,'New','2013-02-04',3,NULL),(8,'New','2013-02-05',3,NULL),(9,'New','2013-02-06',4,NULL),(10,'New','2013-02-07',4,NULL),(11,'New','2013-02-09',4,NULL),(12,'New','2013-02-22',4,NULL),(13,'New','2013-02-25',4,NULL),(14,'New','2013-03-06',5,NULL),(15,'New','2013-04-09',5,NULL),(16,'New','2013-05-02',5,NULL),(17,'New','2013-05-02',6,NULL),(18,'New','2013-06-02',6,NULL),(19,'New','2013-06-02',7,NULL),(20,'New','2013-06-02',7,NULL),(21,'New','2013-08-02',7,NULL),(22,'New','2013-08-02',8,NULL),(23,'New','2013-12-02',8,NULL),(24,'New','2013-12-02',1,NULL),(25,'New','2013-12-02',2,NULL),(26,'New','2014-01-02',11,NULL),(27,'New','2014-02-02',11,NULL),(28,'New','2014-02-02',4,NULL),(29,'New','2014-02-02',9,NULL),(30,'New','2014-06-12',9,NULL),(31,'New','2014-06-23',9,NULL),(32,'New','2014-06-23',8,NULL),(33,'New','2014-07-12',8,NULL),(34,'New','2014-07-13',7,NULL),(35,'New','2014-08-25',7,NULL),(36,'New','2014-08-27',7,NULL),(37,'New','2014-08-23',6,NULL),(38,'New','2014-12-14',6,NULL),(39,'New','2014-12-15',6,NULL),(40,'New','2014-12-16',7,NULL),(41,'New','2014-12-17',7,NULL),(42,'New','2014-12-18',7,NULL),(43,'New','2014-12-20',7,NULL),(44,'New','2014-12-20',8,NULL),(45,'New','2014-12-20',8,NULL),(46,'New','2014-12-22',8,NULL),(47,'New','2014-12-22',11,NULL),(48,'New','2014-12-22',1,NULL);CREATE TABLE product (
pid int NOT NULL,
productname varchar(20) DEFAULT NULL,
price float DEFAULT NULL,
companyid int DEFAULT NULL,
categoryid int DEFAULT NULL,
availablestatus char(1) DEFAULT NULL,
PRIMARY KEY (pid),
CONSTRAINT fkcatid FOREIGN KEY (categoryid) REFERENCES category (categoryid),
CONSTRAINT fkcid FOREIGN KEY (companyid) REFERENCES company (companyid)
);INSERT INTO product VALUES (21,'Galaxy',27000,1001,10003,'Y'),(98,'Galaxy Grand',47000,1001,10003,'Y'),(99,'Note',17000,1001,10003,'Y'),(100,'S5',65000,1001,10003,'Y'),(101,'S6H',68000,1001,10003,'Y'),(102,'Lumia 540',12000,1002,10004,'Y'),(117,'Lumia 430',5292,1002,10004,'Y'),(118,'Lumia 640',15799,1002,10004,'Y'),(119,'Nokia X2',8499,1002,10003,'Y'),(120,'Passport',76000,1004,10001,'Y'),(121,'Classic',20000,1004,10001,'Y'),(122,'Leap',29000,1004,10001,'Y'),(123,'Moto-G',12998,1003,10003,'Y'),(128,'Moto-X',32000,1003,10003,'Y'),(129,'Moto-Y',7000,1003,10003,'Y'),(130,'4S',27000,1005,10002,'Y'),(131,'5S',42000,1005,10002,'Y'),(132,'6',62000,1005,10002,'Y'),(133,'4',17000,1005,10002,'Y'),(134,'6S',67000,1005,10002,'Y');
CREATE TABLE orderitem (
orderid int DEFAULT NULL,
qty int DEFAULT NULL,
amount float,
pid int DEFAULT NULL,
CONSTRAINT fkorid FOREIGN KEY (orderid) REFERENCES orderd (orderid),
CONSTRAINT ofkfkpid FOREIGN KEY (pid) REFERENCES product (pid)
);INSERT INTO orderitem VALUES (1,1,0,100),(1,1,0,21),(1,1,0,98),(2,1,0,100),(2,1,0,118),(2,2,0,119),(3,1,0,121),(3,1,0,123),(4,1,0,123),(4,1,0,122),(5,1,0,102),(5,1,0,101),(5,1,0,100),(6,1,0,121),(6,1,0,122),(6,1,0,123),(6,1,0,128),(7,1,0,134),(7,1,0,132),(7,1,0,131),(7,1,0,101),(7,1,0,102),(7,1,0,117),(8,1,0,132),(8,1,0,131),(8,1,0,130),(8,1,0,98),(8,1,0,21),(8,1,0,100),(8,1,0,101),(9,1,0,131),(9,1,0,122),(9,1,0,123),(9,1,0,102),(9,1,0,101),(9,1,0,100),(10,1,0,98),(10,1,0,21),(10,1,0,101),(10,1,0,100),(11,1,0,134),(11,1,0,132),(11,1,0,131),(11,1,0,128),(11,1,0,123),(11,1,0,117),(11,1,0,102),(11,1,0,101),(11,1,0,100),(12,1,0,100),(12,1,0,101),(12,1,0,21),(12,1,0,21),(12,1,0,134),(12,1,0,134),(12,1,0,117),(13,1,0,102),(13,1,0,101),(14,1,0,101),(14,1,0,123),(15,1,0,123),(16,1,0,123),(17,1,0,101),(17,1,0,100),(17,1,0,99),(18,1,0,98),(19,1,0,101),(20,1,0,100),(21,1,0,98),(21,1,0,101),(21,1,0,100),(22,1,0,21),(22,1,0,99),(22,1,0,101),(23,1,0,21),(23,1,0,98),(24,1,0,101),(25,1,0,100),(26,1,0,100),(27,1,0,132),(27,1,0,131),(27,1,0,121),(27,1,0,122),(28,1,0,122),(28,1,0,100),(29,1,0,133),(29,1,0,121),(30,1,0,101),(30,1,0,100),(31,1,0,134),(31,1,0,131),(31,1,0,99),(31,1,0,98),(31,1,0,100),(31,1,0,101),(32,1,0,133),(32,1,0,129),(32,1,0,128),(32,1,0,100),(32,1,0,117),(33,1,0,101),(33,1,0,99),(33,1,0,98),(33,1,0,21),(34,1,0,98),(34,1,0,118),(35,1,0,119),(36,1,0,120),(37,1,0,121),(38,1,0,130),(39,1,0,132),(40,1,0,133),(40,1,0,129),(41,1,0,132),(41,1,0,130),(41,1,0,121),(42,1,0,120),(43,1,0,102),(44,1,0,102),(45,1,0,101),(46,1,0,101),(47,1,0,21),(48,1,0,21),(48,1,0,98),(48,1,0,99),(47,1,0,99),(47,1,0,102),(47,1,0,118),(45,1,0,134),(44,1,0,134),(43,1,0,133),(43,1,0,132),(42,1,0,134),(42,1,0,133),(41,1,0,102),(31,1,0,119),(21,1,0,120),(21,1,0,117),(21,1,0,118),(11,1,0,120),(11,1,0,119),(11,1,0,123),(21,1,0,123),(31,1,0,128),(41,1,0,133),(41,1,0,134),(34,1,0,133),(44,1,0,134);
CREATE TABLE stock (
pid int DEFAULT NULL,
soh int DEFAULT NULL,
CONSTRAINT psfkpid FOREIGN KEY (pid) REFERENCES product (pid)
);INSERT INTO stock VALUES (21,10),(21,15),(98,20),(99,22),(101,26),(102,19),(117,12),(118,13),(119,15),(120,12),(121,11),(122,15),(123,17),(128,19),(129,22),(130,28),(131,29),(132,28),(133,39),(134,19);





SELECT * FROM COMPANY WHERE COMPANYID =1001 OR COMPANYID=1002;

SELECT * FROM COMPANY WHERE COMPANYID IN(1001,1002);

SELECT * FROM COMPANY WHERE COMPANYID =1001 AND COMPANYNAME='Samsung';
SELECT * FROM COMPANY WHERE COMPANYID NOT IN(1001,1002);
SELECT * FROM CUSTOMER WHERE CUSTOMERNAME like '%sh';
SELECT * FROM CUSTOMER WHERE CUSTOMERNAME like 'A%';
SELECT * FROM CUSTOMER WHERE CUSTOMERNAME like '_a%';
SELECT * FROM orderd where orderdate >='2013-01-01' and orderdate <= '2013-06-09';
SELECT * FROM orderd where orderdate between '2013-01-01' and  '2013-06-09';

SELECT * FROM PRODUCT WHERE COMPANYID=(SELECT COMPANYID FROM COMPANY WHERE COMPANYNAME='nokia');
SELECT * FROM customer;

SELECT * FROM CUSTOMERADDRESS WHERE CITY='BANGALORE';

SELECT * FROM CUSTOMER WHERE CUSTOMERID IN (SELECT CUSTOMERID FROM CUSTOMERADDRESS WHERE CITY='BANGALORE');


select * from category;
select * from company;
select * from customer;
select * from customeraddress;
select * from orderd;
select * from orderitem;
select * from product;
select * from stock;

SELECT customername FROM CUSTOMER WHERE customerid IN (SELECT customerid FROM orderd where orderid in 
(select orderid from orderitem where pid=(select pid from product  WHERE PRODUCTNAME='Galaxy Grand')));
select * from product;

select companyname,productname,c.companyid from company c inner join
product p on c.companyid=p.companyid;

-- customername,city

select customername,city from customeraddress c inner join
customer d on c.customerid=d.customerid;

-- customername,orderid

select customername,orderid from customer c inner join orderd d on c.customerid=d.customerid;


select o.orderid ,sum(o.qty*p.price)as amount from
orderitem o inner join product p
on o.pid =p.pid
group by o.orderid
order by o.orderid;

select o.orderid ,sum(o.qty*p.price)as amount from
orderitem o inner join product p
on o.pid =p.pid
group by o.orderid
having sum(o.qty*p.price)>20000
order by o.orderid;

