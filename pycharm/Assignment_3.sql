USE db20174144
-- Question 1
--
-- 1
--
SELECT F_Name,M_Name,S_Name,Contact_No FROM STUD_MEMBER;
--
-- 2
--
SELECT F_Name,M_Name,S_Name,Contact_No FROM STUD_MEMBER 
INNER JOIN DEPARTMENT ON STUD_MEMBER.Dept_Id=DEPARTMENT.Dept_Id 
WHERE DEPARTMENT.Dept_Name='IT';
--
-- 3
--
SELECT DISTINCT Dept_Name FROM DEPARTMENT 
INNER JOIN STUD_MEMBER ON DEPARTMENT.Dept_Id=STUD_MEMBER.Dept_Id 
WHERE (SELECT COUNT(DEPARTMENT.Dept_Id) FROM STUD_MEMBER) <> 0;
--
-- 4
--
SELECT DISTINCT Dept_Name FROM DEPARTMENT,STUD_MEMBER 
WHERE DEPARTMENT.Dept_Id NOT IN (SELECT Dept_Id FROM STUD_MEMBER);
--
-- 5
--
SELECT Dept_Name FROM DEPARTMENT;
--
-- 6
--
SELECT F_Name,M_Name,S_Name FROM STUD_MEMBER 
INNER JOIN DEPARTMENT ON STUD_MEMBER.Dept_Id=DEPARTMENT.Dept_Id 
WHERE DEPARTMENT.Dept_Name='Electrical';
--
-- 7
--
SELECT * FROM STUD_MEMBER WHERE F_Name LIKE 'A%';
--
-- 8
--
SELECT * FROM STUD_MEMBER WHERE Gender= 'M';
--
-- 9
--
SELECT * FROM STUD_MEMBER WHERE Semester=3;
--
-- 10
--
SELECT * FROM STUD_MEMBER WHERE Gender= 'F' ORDER BY F_Name,M_Name,S_Name;
--
--
-- Question 2
--
--
-- 1
--
SELECT * FROM products INNER JOIN sales ON products.OrderID=sales.OrderID 
WHERE (SELECT YEAR(products.Manufacture_Date))=(SELECT YEAR(sales.OrderDate));
--
-- 2
--
SELECT products.Product_id FROM 
((products INNER JOIN  Vendor_info ON products.Vendor_Id=Vendor_info.Vendor_id) 
INNER JOIN sales ON products.OrderID=sales.OrderId) 
WHERE (SELECT YEAR(products.Manufacture_Date))=(SELECT YEAR(sales.OrderDate)) 
AND Vendor_info.Vendor_name='Smith';
--
-- 3
--
SELECT YEAR(OrderDate),COUNT(OrderDate) FROM sales GROUP BY YEAR(OrderDate);
--
-- 4 
-- 
SELECT YEAR(OrderDate),COUNT(OrderDate) FROM sales 
WHERE OrderId IN (SELECT DISTINCT products.OrderId FROM products,Vendors 
WHERE products.Vendor_Id IN (SELECT Vendor_Id FROM Vendors WHERE Vendors='Wills')) GROUP BY YEAR(OrderDate);
--
-- 5
--
SELECT DISTINCT Vendors.Vendors from Vendors,sales 
WHERE Vendors.Vendors IN (SELECT CustomerName FROM sales);
--
-- 6 
--
SELECT SUM(OrderQuantity) FROM sales WHERE OrderID 
IN (SELECT OrderId FROM products WHERE Raw_Material IN ('Milk','Pulses','Bread'));
--
-- 7
--
SELECT OrderQuantity FROM sales WHERE OrderID 
IN (SELECT OrderId FROM products WHERE Raw_Material='Bread');
--
-- 8
--
SELECT products.Product_id FROM 
((products INNER JOIN  Vendor_info ON products.Vendor_Id=Vendor_info.Vendor_id) 
INNER JOIN sales ON products.OrderID=sales.OrderId) 
WHERE Vendor_info.Vendor_name<>sales.CustomerName;

--
-- 9
--
SELECT products.Product_id,sales.CustomerName FROM 
((products INNER JOIN  Vendor_info ON products.Vendor_Id=Vendor_info.Vendor_id) 
INNER JOIN sales ON products.OrderID=sales.OrderId) 
WHERE products.Raw_Material='Milk' AND Vendor_info.Vendor_name='Smith';
--
-- 10
--
 SELECT SUM(sales.OrderQuantity),Vendor_info.Vendor_name FROM 
 ((products INNER JOIN  Vendor_info ON products.Vendor_Id=Vendor_info.Vendor_id) 
 INNER JOIN sales ON products.OrderID=sales.OrderId) 
 GROUP BY Vendor_info.Vendor_name;