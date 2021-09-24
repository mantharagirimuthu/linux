-- 1. List all the products
SELECT * FROM PRODUCT;

-- 2. List product name and product price
select productname,price from product;

-- 3. List all customers
select * from customer;
-- 4. List Customername and mobile no
select customername,mobileno from customer;

-- 5. List all orders
select * from orderd;
-- 6. List customer id and orderd date
select customerid,orderdate from orderd;

-- 7. List all the order item
select * from orderitem;
-- 8. List all the product with product id 100
select pid from orderitem where pid=100;

-- 9. List all the info of product with name s5
select * from product where productname='s5';

-- 10. List pid, productname, price of the phone named "galaxy grand"
select pid,productname,price from product  WHERE PRODUCTNAME='Galaxy Grand';


-- 11. Print product info for all the product with category id 2003
select * from product where categoryid=10003;

-- 12. List all the customers address with city as 'Bangalore'
select * from customeraddress where city='Bangalore';

-- 13. List all the orders which was ordered on '2013-02-02'
SELECT * FROM orderd where orderdate ='2013-02-02';

-- 14. Print all the orders of the customer with id 1
SELECT * FROM orderd where customerid=1;

-- 15. List all the product with company id 1001 or 1002
select * from product where  companyid=1001 or companyid=1002;


-- 16. List all the product with price more than 30000
select * from product where price>30000;

-- 17. List all the products of the category id 2001 or 2003 with
-- the price more than 30000
select productname,price,categoryid from product where price>30000 and categoryid in(10001,10003);

-- 18. List all the order customer id 1 or 4 ordered on '2013-02-02'
-- or '2013-02-07'
select customerid,orderid,orderdate from orderd where customerid in(1,4) and orderdate in('2013-02-02','2013-02-07');
-- 19. List all the customer whos name starts with character 'A'
SELECT * FROM CUSTOMER WHERE CUSTOMERNAME like 'A%';

-- 20. List all the customer who name ends with character 'i'
SELECT * FROM CUSTOMER WHERE CUSTOMERNAME like '%i';

-- 21. List all the customer whos name starts with 'R' and ends with 'i'
SELECT * FROM CUSTOMER WHERE CUSTOMERNAME like 'r%i';

-- 22. List all the orders for the year 2013
SELECT * FROM orderd where orderdate >='2013-01-01' and orderdate <= '2013-12-31';

-- 23. List all the products which are not from the category 10001

select * from product where categoryid not in(10001);

-- 24. List all the products which are not from the category 10001
-- or 10003 with the price more than 30000 and product name starts
-- with '6'
select * from product where categoryid not in(10001,10003) and price>30000 and productname like '6%';



-- 25. List all the customers whos mobile no doesnt start with 9
select * from customer where mobileno not like '9%';


-- 26. List all the nokia phones
 select * from product where companyid=(select companyid from company where companyname='Nokia');
 
 select p.productname,c.companyname from product p
inner join company c on 
c.companyid=p.companyid
where c.companyname='Nokia';


-- 27. List all the samsung phones
select * from product where companyid=(select companyid from company where companyname='samsung');

 select p.productname,c.companyname from product p
inner join company c on 
c.companyid=p.companyid
where c.companyname='Samsung';



-- 28. List all the iphone phones
select * from product where companyid=(select companyid from company where companyname='iphone');

 select p.productname,c.companyname from product p
inner join company c on 
c.companyid=p.companyid
where c.companyname='iphone';


-- 29. List all the customers from Bangalore
SELECT * FROM CUSTOMER WHERE CUSTOMERID IN (SELECT CUSTOMERID FROM CUSTOMERADDRESS WHERE CITY='BANGALORE');

select * from customer c
inner join customeraddress a on
c.customerid=a.customerid 
where a.city='Bangalore';

-- 30. List all the customers who are not from Bangalore
SELECT * FROM CUSTOMER WHERE CUSTOMERID IN (SELECT CUSTOMERID FROM CUSTOMERADDRESS WHERE CITY!='BANGALORE');

select * from customer c
inner join customeraddress a on
c.customerid=a.customerid 
where a.city !='Bangalore';

-- 31. List all the customer who have orderd on the date '2013-02-02'

select customerid,customername from customer where customerid in(select customerid from orderd where orderdate='2013-02-02');

select * from customer c
inner join orderd a on 
c.customerid=a.customerid
where orderdate=('2013-02-02');

-- 32. List all the customer who have orderd for phone '6S'


select * from customer where customerid in(select customerid from orderd where orderid in
(select orderid from orderitem where pid=(select pid from product where productname='6S')));

select * from customer c inner join orderd o
on c.customerid=o.customerid inner join 
orderitem oi on o.orderid=oi.orderid inner join
product p  on oi.pid=p.pid
where productname='6S';


-- 33. List all the customers who have ordered for 4s  from bangalore

select * from customer where customerid in
(select customerid from customeraddress where city='Bangalore' and customerid in
(select customerid from orderd where orderid in
(select orderid from orderitem where pid=(select pid from product where productname='4S'))));

select * from CUSTOMER C inner join CUSTOMERADDRESS D 
on D.CUSTOMERID =C.CUSTOMERID inner join 
ORDERD O on C.CUSTOMERID=O.CUSTOMERID inner join
ORDERITEM OI on O.ORDERID=OI.ORDERID
where OI.PID=(select PID from PRODUCT where PRODUCTNAME='4S') and D.CITY='BANGALORE';

-- 34. List all the phones which Goutham orderd for
select * from orderd;
select * from customer;
select * from product;
select * from orderitem;
select * from product where pid in
(select pid from orderitem where orderid in(select orderid from orderd where customerid in(select customerid from customer where customername='Goutham')));

select * from product p inner join orderitem oi
on p.pid=oi.pid inner join 
ORDERD O on oi.orderid=o.orderid inner join
customer c on o.customerid=c.customerid
where customername='goutham';


-- 35. List all the phones which Amrutha orderd for in the 2014

select * from product where pid in
(select pid from orderitem where orderid in(select orderid from orderd where orderdate >='2014-01-01' and orderdate <= '2014-12-31' and 
customerid = (select customerid from customer where customername='Amrutha')));

select * from product p inner join orderitem oi
on p.pid=oi.pid inner join 
ORDERD O on oi.orderid=o.orderid and orderdate >='2014-01-01' and orderdate <= '2014-12-31'inner join
customer c on o.customerid=c.customerid
where customername='Amrutha';

-- 36. List all the customer who have not bought any product

-- 37. List Fav phones of Bangalorean
select * from product where pid IN
(
select pid from orderd where customerid IN
(
select customerid from customeraddress where city='Bangalore'
)
);


-- 38. List all the products which were sold in the year 2013

select * from product where pid in
(select pid from orderitem where orderid in(select orderid from orderd where orderdate >='2013-01-01' and orderdate <= '2013-12-31' ));

select * from product p inner join orderitem oi
on p.pid=oi.pid inner join 
ORDERD o on oi.orderid=o.orderid and orderdate >='2013-01-01' and orderdate <= '2013-12-31';


-- 39. List all the Nokia phones orderd by 'Ravi'



select * from company;
select * from customer;

select * from product where  companyid in (select companyid 
from company  where companyname='nokia' and companyid in(select companyid from product where pid in 
(select pid from orderitem where orderid in(select orderid from orderd where customerid in(select customerid from customer where customername='ravi')))));

select * from product p inner join 
company c on c.companyname='nokia' and c.companyid=p.companyid
inner join orderitem oi on p.pid=oi.pid inner join orderd o on oi.orderid=o.orderid inner join customer cu on o.customerid=cu.customerid where customername='ravi';


-- 40. List all the phones with its company name

select p.productname,c.companyname from product p 
inner join company c on
c.companyid=p.companyid;

-- 41. List companyid, companyname, productname, product price of all products

select c.companyid,c.companyname,p.productname,p.price from product p
inner join company c on
c.companyid=p.companyid;


-- 42. List customer name, stname and city of all the customer.

select c.customername,ca.stname,ca.city from customer c
inner join customeraddress ca on
c.customerid=ca.customerid;

-- 43. List customer name and customer city of all the customer
-- who have never bought any product

-- 44. List Customer id, customer name, orderdate, of all the orders

-- 45. List Customer id, customer name, orderdate, company and
-- product name with qty, price of all the orders

-- 46. List Customer id, customer name, orderdate, company and
-- product name with qty, price and amount of all the orders
-- where amount is qty*price

/* 47. List Customer id, customer name, orderdate, company and
product name with qty, price and amount of all the orders
where amount > 50,000 (amount is qty*price) */

/* 48. List customerid, customername, city, companyname, productname,
qty, price and amount of all the products orderd */

/* 49. List all product, company, customer and
customer address details for all orders
which were ordered in the year 2014
*/

/* 50. Update amount of order item */


/* 51. Get the total sales based on orderid */



/* 52. Get the total sales based on given month */



/* 53. Get the total sales based on year */



/* 54. Get the total sales based on month and year */


/* 55. Total sales based on product */


/* 56. Total sales based on company */


/* 57. Display top 3 sold mobiles */


/* 58. Top 3 customers based on billing amount */


/* 59. Top 3rd customer based on billing amount */


/* 60. Display all unique phones which are sold */


/* 61. Display all phones which are sold with the no. of quantity */


/* 62. Name of the top priced phone */


