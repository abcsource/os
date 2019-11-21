-- question 1
create table salary(
Emp_No number,
Basic number,
HRA number,
DA number,
Total_Dedution number,
Net_Salary number,
Gross_Salary number);

create table salary_new(
Emp_No number,
Basic number,
HRA number,
DA number,
Total_Dedution number,
Net_Salary number,
Gross_Salary number);

insert into salary values(2,15000,4000,1000,5000,15000,20000); 
insert into salary values(1,31000,8000,1000,5000,35000,40000);
insert into salary values(3,14000,4000,1000,5000,15000,19000);
insert into salary values(4,14000,4000,1000,5000,15000,19000);
insert into salary values(5,13000,4000,1000,5000,15000,18000);

create table salary_new(
Emp_no number,
Basic number,
HRA number,
DA number,
Total_Dedution number,
Net_Salary number,
Gross_Salary number
);

create or replace trigger salary_change before update on salary
for each row 
begin
	insert into salary_new values(:OLD.Emp_no, :OLD.Basic, :OLD.HRA, :OLD.DA , :OLD.Total_Dedution, :OLD.Net_Salary, :OLD.Gross_Salary);
end;
/
update Salary set basic = 20000 where Emp_no=3;
-- question 2
create table item_master(
	item_id number,
	description varchar(20),
	bal_stock number
);
create table item_requisite(
	item_id number,
	dept_code varchar(20),
	quantity number	
);

insert into item_master values(101,'keyboard',80);
insert into item_master values(102,'lathe_machine',70);
insert into item_master values(103,'compass',100);
insert into item_master values(104,'beaker',90);
insert into item_master values(105,'ammeter',60);

insert into item_requisite values(101,'keyboard',30);
insert into item_requisite values(102,'mech',20);
insert into item_requisite values(103,'civil',25);
insert into item_requisite values(104,'chem',35);
insert into item_requisite values(105,'elect',80);


create or replace trigger change_requisite before delete on item_requisite
for each row
DECLARE
	txt EXCEPTION;
	bal_stock number;
begin
	select bal_stock into bal_stock from item_master where item_id=:OLD.item_id;
	if(:old.quantity > bal_stock)
	then
		 RAISE_APPLICATION_ERROR(-20000,'Invalid operation');
	else
		update item_master set bal_stock = bal_stock - :OLD.quantity where item_id = :OLD.item_id;
	end if;
end;
/

delete from item_requisite where item_id=104;

-- question 3
create table emp(
	emp_id number, 
	emp_name varchar(20), 
	mgr varchar(20)
);
insert into emp values(1001,'Anna',Null);
insert into emp values(1002,'Anthony','Anna');
insert into emp values(1003,'Andy','Sachin');
insert into emp values(1004,'Sam','Anna');
insert into emp values(1005,'Tom','Sam');
insert into emp values(1006,'Ricky','Sam');
insert into emp values(1007,'Sachin','Anna');
insert into emp values(1008,'Amy','Anthony');
insert into emp values(1009,'Cristina','Anna');
insert into emp values(1010,'Jennifer','Anthony');

create or replace trigger deleted_emp before delete on emp
for each row
begin
	update emp set mgr=null where mgr=:OLD.mgr;
end;
/





