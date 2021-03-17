declare
t_name  Waiter.Fname%type;
t_salary Waiter.salary%type;
counter number(2):=1;
num integer;

procedure updateSalary (newSalary waiter.salary%type) is

begin
update waiter set salary=newSalary where salary<=8000;
commit;

while counter <=9
loop
select Fname, salary into t_name,t_salary from waiter where waiter_id=counter;
dbms_output.put_line('waiter Name='||t_name||'    '|| 'Salary='||t_salary);
counter :=counter+1;
end loop;
end;

function another (k ORDERINFO.Order_id%type)
return integer is
begin
select count(*) into num  from MENUBILL  where Order_id=k ;
return num;
end;

begin
	updateSalary(10000);
dbms_output.put_line('Total Ordered item ' || another(2));
end;


