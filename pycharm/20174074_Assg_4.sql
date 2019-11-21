USE db20174144
--
-- (1) Write the SQL queries for the following with respect to database created: –

-- a) Fetch first name, last name of worker using alias name as E_Name.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS E_Name FROM Employee;

-- b) List the last name of employees in upper case.
SELECT UCASE(LAST_NAME) AS LAST_NAME FROM Employee; 

-- c) Retrieve the first three characters of employees from their first name.
SELECT LEFT(FIRST_NAME,3) FROM Employee;

-- d) Retrieve the unique values of department and display its length.
SELECT DISTINCT DEPARTMENT,LENGTH(DEPARTMENT) FROM Employee;

-- e)List the first name from employees table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, "a","A") FROM Employee;

-- f) Display all employee details, use order by in first name asec and salary in desc.
SELECT * FROM Employee ORDER BY FIRST_NAME ASC,SALARY DESC;

-- g) List the details of an employee whose first name ends with ‘h’ and contains six alphabets.
SELECT * FROM Employee WHERE FIRST_NAME LIKE '%h' AND LENGTH(FIRST_NAME)=6;

-- h) Display the details of employees who have joined in Feb 2014.
SELECT * FROM Employee WHERE YEAR(JOINING_DATE)=2014 AND MONTH(JOINING_DATE)=2;

-- i) Fetch the employee’s names with salaries over and equal to 50000 and less than equal to 100000.
SELECT CONCAT(FIRST_NAME,LAST_NAME) AS E_NAME,SALARY FROM Employee WHERE SALARY>=50000 AND SALARY<=100000;

-- j) List the no. of employees for each department in desc order.
SELECT COUNT(E_Id),DEPARTMENT FROM Employee GROUP BY DEPARTMENT ORDER BY COUNT(E_Id) DESC;

-- k) Print the details of employees who are also managers.
SELECT * FROM Employee INNER JOIN Job_Title ON Employee.E_Id=Job_Title.E_Ref_Id WHERE Job_Title.E_Title='Manager';

-- l) Fetch the duplicate records having matching data in some fields of a table. (Using departmentcolumn.)
SELECT COUNT(E_Id),DEPARTMENT FROM Employee GROUP BY DEPARTMENT;

-- k) Fetch intersecting records of two tables.
SELECT * FROM Employee INNER JOIN Job_Title ON Employee.E_Id=Job_Title.E_Ref_Id;

-- m) Find the nth (say n=5) highest salary from a table.
SELECT SALARY FROM (SELECT DISTINCT SALARY FROM Employee ORDER BY SALARY DESC LIMIT 5) AS Temp ORDER BY SALARY LIMIT 1;

-- n) Find the 4th highest salary without using TOP or limit method.
SELECT MAX(SALARY) AS '4th Highest Salary' FROM Employee WHERE SALARY<(SELECT MAX(SALARY) AS MAX3 FROM Employee WHERE SALARY<(SELECT MAX(SALARY) FROM Employee WHERE SALARY<(SELECT MAX(SALARY) FROM Employee)));

-- o) List the details of employees with the same salary.
SELECT E1.* FROM Employee AS E1,Employee AS E2 WHERE E1.E_Id!=E2.E_Id AND E1.SALARY=E2.SALARY;

-- p) Display the second highest salary from a table.
SELECT MAX(SALARY) AS '2nd Highest Salry' FROM Employee WHERE SALARY<(SELECT MAX(SALARY) FROM Employee);

-- q) Display all departments along with the number of people in there.
SELECT COUNT(E_Id),DEPARTMENT FROM Employee GROUP BY DEPARTMENT;

-- s) List the name of employees having the highest salary in each department.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS E_NAME,SALARY AS MAXIMUM_SALARY,DEPARTMENT FROM Employee WHERE (SALARY,DEPARTMENT) IN (SELECT MAX(SALARY) AS MAXIMUM_SALARY,DEPARTMENT FROM Employee GROUP BY DEPARTMENT);

-- t) Fetch three min salaries from a table
SELECT DISTINCT SALARY AS '3 MIN SALARY' FROM Employee ORDER BY SALARY LIMIT 3;

-- u) Fetch departments along with the total salaries paid for each of them.
SELECT SUM(SALARY) AS TOTAL_SALARY,DEPARTMENT FROM Employee GROUP BY DEPARTMENT;

-- v) Fetch the names of employees who earn the highest salary.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS E_NAME FROM Employee WHERE SALARY=(SELECT MAX(SALARY) FROM Employee);

-- w) List the employee details whose joining year is “2013”?
SELECT * FROM Employee WHERE YEAR(JOINING_DATE)=2013;

-- x) Find the Joining Date and Time from employee table
SELECT DATE(JOINING_DATE) AS DATE,TIME(JOINING_DATE) AS TIME FROM Employee;

-- y) Fetch the department wise minimum salary from employee table order by salary ascending.
SELECT MIN(SALARY) AS MINIMUM_SALARY,DEPARTMENT FROM Employee GROUP BY DEPARTMENT ORDER BY MINIMUM_SALARY;

-- z) Fetch department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending
SELECT DEPARTMENT,COUNT(E_Id) AS TOTAL_EMPLOYEES,SUM(SALARY) AS TOTAL_SALARY FROM Employee GROUP BY DEPARTMENT;

