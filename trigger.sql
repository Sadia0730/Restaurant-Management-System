set serveroutput on
create or replace trigger trigger1 
after delete on waiter
for each row
declare
wid WAITER.WAITER_ID%type;
fname Waiter.Fname%type;
lname Waiter.Lname%type;
con Waiter.Contact%type;
addr Waiter.Address%type;
sal Waiter.Salary%type;
jd Waiter.Join_Date%type;
begin
SELECT Waiter_id,Fname,Lname,Contact,Address,Salary,Join_Date into wid, fname,lname,con,addr,sal,jd from waiter where waiter_Id =  8;
insert into resigned(R_Id,oldId,Fname,Lname,Contact,Address,Salary,Join_Date,Join_OUT_DATE)
values(1,wid,fname,lname,con,addr,sal,jd,date '2018-04-25');

commit;
end;
/
