select customerid,customername from customer where customerid in
(select customerid from orderd where orderid in
(select orderid from orderitem where pid=(select pid from product where productname='6S')));
