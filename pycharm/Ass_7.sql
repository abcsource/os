set serveroutput ON;
-- Q1). Write a PL/SQL program to print “HELLO WORLD”.

BEGIN
  dbms_output.put_line('HELLO WORLD');
END;
/


/*
Q2). Write a PL/SQL code for inverting a number. (Example: 1234 – 4321)
*/

DECLARE
  n integer;
  ans number :=0;
  pro number :=1;
  ad number :=1;
  temp number;
  
BEGIN
  n:=&n;
  WHILE n>0 LOOP
    ans := ans * 10;
    temp := mod(n,10);
    ans := ans + temp;
    n := n / 10;
  END LOOP;
   dbms_output.put_line(ans);
END;
/

-- Q4). Write a PL/SQL code to find the greatest number among three with Anonymous blocks.

DECLARE 
  a integer := 20;
  b integer := 30;
  c integer := 40;

BEGIN

  IF (a>=b) AND (a>=c)
  THEN
    dbms_output.put_line(a);
  ELSIF (b>=c) AND (b>=a)
  THEN
    dbms_output.put_line(b);
  ELSE
    dbms_output.put_line(c);
  END IF;
END;
/
  
/*
Q5).Write a PL/SQL code to calculate the area of a circle where radius takes VALUES from 3 to 7.
Store the calculated area in Table AREA.
The schema of table is given below:
AREA (Radius, Area)
*/
CREATE TABLE areas( r number(2), area number(14,2) );
DECLARE
  r number(5);
  pi number(4,2) := 3.14;
  area number(14,2);
BEGIN
  r := 3;
  for i in 0 .. 4
  loop
    area := (r+i)*(r+i)*pi;
    INSERT INTO areas VALUES(r+i,area);
  END loop;
END;
/
SELECT * FROM areas;

-- Q6). Write a PL/SQL program to accept a number and find the factorial of the number    

DECLARE
  num number(2);
  ans number(7) := 1;
BEGIN
  num := &x;
  for i in 1 .. num loop
    ans:= ans*i;
  END loop;
  dbms_output.put_line(ans);
END;
/

-- Q7). Write a PL/SQL program to display the months between two dates of a year  

DECLARE
  date1 date;
  date2 date;
  ans number(4);
BEGIN
  date1 := to_date('12-21-1999','MM-DD-YYYY');
  date2 := to_date('10-16-2019','MM-DD-YYYY');
  ans := months_between(date1,date2);
  dbms_output.put_line(ans);
END;
/

/*Q8). Create an Account_Master table & insert the tuples as given the question. Write a PL/SQL
code that will accept an account number from user. IF the balance of account is less than
minimum balance (i.e 1000) deducts Rs 100 from balance*/

CREATE TABLE Account_Master(acct_no   number(5)   primary   key,acct_holder_name
varchar2(10),balance number(10));
INSERT INTO Account_Master VALUES(1,'John',1000);
INSERT INTO Account_Master VALUES(2,'Denis',100);
INSERT INTO Account_Master VALUES(3,'Albert',1100);
INSERT INTO Account_Master VALUES(4,'Charles',700);
INSERT INTO Account_Master VALUES(5,'Darwin',1700);
declare
  person Account_Master%rowtype;
  accno number(1);
  newbalance number(4);
BEGIN
  accno := 4;
  SELECT * into person FROM Account_Master where acct_no=accno;
  IF person.balance < 1000
  then
    newbalance := person.balance-100;
    UPDATE Account_Master SET balance=person.balance-100 WHERE acct_no=accno;
  END IF;
END;
/
SELECT * FROM Account_Master;
