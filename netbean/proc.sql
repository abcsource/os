-- do not callprocedureusing select query
-- question 1
set serveroutput on; 
declare
  a number;
  b number;
  c number;
procedure findmin(x in number, y in number,z out number) is
begin
  if x<y
  then
    z := x;
  else
    z := y;
  end if;
end;
begin
  a:=23;
  b:=45;
  findmin(a,b,c);
  dbms_output.put_line('Minimum is '||c);
end;
/
-- question 2
set serveroutput on;
create or replace function totalCustomers
return number is
  total number(2) :=0
begin
  select count(*) into total from customer;
  return total;
end;
/
-- question 3
set serveroutput on;
declare
a number :=2;
function findFactorial(f number)
return number is fa number;
begin
  if f=0
  then
    fa :=1;
  else
    fa := findFactorial(f-1);
    fa := fa*f;
  end if;
  return fa;
end;
begin
  a:=6;
  a:=findFactorial(a);
  dbms_output.put_line(a);
end;
/
-- question 4
set serveroutput on;
declare 
procedure outerprocedure is
procedure innerprocedure is begin
  dbms_output.put_line('Inner Procedure');
end  innerprocedure;
begin
  innerprocedure;
  dbms_output.put_line('Outer Procedure');
end outerprocedure;
begin
  outerprocedure;
end;
/