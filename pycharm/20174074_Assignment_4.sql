USE db20174144;

-- Question 1

--
-- 1
--
SELECT client_name,city FROM client;
--
-- 2
--
SELECT * FROM product;
--
-- 3
--
SELECT client_name FROM client WHERE client_name LIKE '_a%';
--
-- 4
--
SELECT client_name FROM client WHERE city = 'tezpur';
--
-- 5
--
SELECT product_name FROM product WHERE sell_price > 2000 AND sell_price <= 5000;
--
-- 6
--
ALTER TABLE product ADD NEW_PRICE int;
UPDATE product SET NEW_PRICE = 10000;
--
-- 7
--
ALTER TABLE sales_order_details CHANGE product_rate new_product_rate int;
-- 
-- 8
--
SELECT * FROM product ORDER BY product_description;
--
-- 9
--
SELECT sales_order_no,sales_order_date FROM sales_order_details;
--
-- 10
--
DELETE FROM sales_order_details WHERE delivery_date < '2008-08-25';
--
-- 11
--
UPDATE sales_order_details SET delivery_date='2018-08-16' WHERE sales_order_no='on01008'
--
-- 12
--
UPDATE client SET bal_due=1200 WHERE client_id='cn01003';
--
-- 13
--
SELECT * FROM product WHERE product_description IN ('HDD1034','DVDRW');
--
-- 14
--
SELECT * FROM client WHERE state <> 'assam';
--
-- 15
--
SELECT * FROM sales_order_details WHERE MONTH(cancel_date)=3;
--
--
--                       

