USE db20174144

-- Q1)

--  a) 
CREATE VIEW Client_view1 AS SELECT * FROM client;
SELECT * FROM Client_view1;

-- b)
CREATE VIEW Client_vw2 AS SELECT client_id,city,bal_due FROM client;
SELECT * FROM Client_vw2;

-- c)
CREATE VIEW Client_vw3 AS SELECT client_id AS CID,client_name AS cname,Address AS Addr FROM client;
SELECT * FROM Client_vw3;

-- d)
SELECT client_name,bal_due FROM Client_view1 WHERE client_id='cn01001';

-- e)
INSERT INTO Client_vw2 VALUES ('cn02003', 'alld',  50000);
SELECT * FROM Client_vw2;

-- f)
UPDATE Client_vw2 SET bal_due=1000 WHERE client_id='cn01004';
SELECT * FROM Client_vw2;

-- g)
DELETE FROM Client_vw2 WHERE client_id='cn02003';
SELECT * FROM Client_vw2;

-- h)
DROP VIEW Client_vw3;

-- i)
CREATE VIEW Client_vw4 AS SELECT client.client_id,client.client_name,client.bal_due,client2.phone 
FROM client INNER JOIN client2 ON client2.client_id=client.client_id;
SELECT * FROM Client_vw4;

-- Q2) --

-- a)
CREATE VIEW salesman_ny AS SELECT * FROM salesman1 WHERE city='New York';
SELECT * FROM salesman_ny;

-- b)
CREATE VIEW salesman_b AS SELECT s_id,Name,city FROM salesman1;
SELECT * FROM salesman_b;

-- c)
 SELECT * FROM salesman_ny WHERE comission>0.13;

-- d)
CREATE VIEW customer_gc AS SELECT Grade,COUNT(C_Id) AS customer_count FROM customer1 GROUP BY Grade;
SELECT * FROM customer_gc;

-- e)
CREATE VIEW view5 AS SELECT COUNT(DISTINCT C_ID) AS 
Customer_COUNT,COUNT(DISTINCT S_ID) AS salesman_COUNT,AVG(Purchase_amt) AS Average_amount,SUM(Purchase_amt) 
AS total_amount,O_Date FROM orders1 GROUP BY O_Date;
SELECT * FROM view5;

-- f)
CREATE VIEW view6 AS SELECT orders1.O_NO,customer1.C_Name,salesman1.Name FROM 
((orders1 INNER JOIN customer1 ON customer1.C_Id=orders1.C_ID)INNER JOIN salesman1 ON salesman1.s_id =orders1.S_ID);
SELECT * FROM view6;

-- g)
CREATE VIEW view7  AS SELECT salesman1.Name,orders1.purchase_amt,orders1.O_Date FROM orders1 
INNER JOIN salesman1 ON salesman1.s_id=orders1.S_ID 
WHERE (orders1.Purchase_amt,orders1.O_Date) IN (SELECT MAX(Purchase_amt),O_Date FROM orders1 GROUP BY O_Date);
SELECT * FROM view7;

-- h)
CREATE OR Replace VIEW temp AS SELECT s_id,count(*) FROM esalesman1 GROUP BY s_id HAVING count(*)>=3;
CREATE OR Replace VIEW esalesman2  AS SELECT A.s_id , A.name FROM salesman1 A INNER JOIN temp B ON A.s_id = B.s_id;
SELECT * FROM esalesman2;

-- i)
CREATE VIEW View9 AS SELECT c_name FROM customer1 WHERE Grade=(SELECT MAX(Grade) FROM customer1);
SELECT * FROM View9;

-- j)
CREATE VIEW view10 AS SELECT COUNT(*) AS salesman_count,city FROM salesman1 GROUP BY city;
SELECT * FROM view10;

-- k)
CREATE VIEW view11 AS SELECT AVG(orders1.Purchase_amt) AS Average_amount,salesman1.Name FROM orders1 
INNER JOIN salesman1 ON salesman1.s_id=orders1.s_id GROUP BY salesman1.s_id;
SELECT * FROM view11;

-- l)
CREATE VIEW view12 AS SELECT DISTINCT salesman1.Name FROM orders1 AS o1 
INNER JOIN salesman1 ON salesman1.s_id=o1.S_ID WHERE (SELECT COUNT(*) FROM orders1 WHERE orders1.S_ID=o1.S_ID GROUP BY S_ID)>1;
SELECT * FROM view12;

-- m)
CREATE OR Replace VIEW city_city AS SELECT DISTINCT A.city AS cutomer_city, B.city AS seller_city FROM customer1 A INNER JOIN salesman1 B ON A.S_Id = B.s_id;
CREATE OR Replace VIEW req AS SELECT A.c_id , A.C_name AS Customer_Name , B.s_id, B.name AS seller_name FROM customer1 A INNER JOIN city_city C INNER JOIN salesman1 B ON A.city = C.cutomer_city AND C.seller_city = B.city;
 SELECT * FROM req;

-- n)
CREATE OR Replace VIEW num AS SELECT O_date , COUNT(*) AS orders FROM orders1 GROUP BY O_date ;
SELECT * FROM num;

-- o)
CREATE OR Replace VIEW chack1 AS SELECT DISTINCT  s_id FROM orders1 WHERE O_date = '2012-10-10';
SELECT * FROM chack1;

-- p)
CREATE OR Replace VIEW chack2 AS SELECT DISTINCT  s_id FROM orders1 WHERE O_date = '2012-10-10' OR O_date='2012-10-17';
SELECT * FROM chack2;

