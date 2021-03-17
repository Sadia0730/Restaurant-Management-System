SET SERVEROUTPUT ON
create or replace trigger triggern 
after insert on Menubill
for each row
declare
    /* pragma autonomous_transaction;*/
     pr MENU.PRICE%type;
     mid MENU.Menu_Id%type;
     quantity MENUBILL.Quantity%type;

     item MENU.NAME%type;
     summ ORDERINFO.TOTAL%type;
   
begin
    /* SELECT  Menu_Id, Quantity into mid ,quantity FROM MENUBILL where order_id =1;*/
     mid:=:new.Menu_Id;
     quantity:=:new.Quantity;
     SELECT Price into pr FROM MENU WHERE Menu_Id=mid;
     SELECT Total into summ FROM ORDERINFO WHERE order_Id=:new.Order_Id;
 
     summ:=summ+quantity*pr;  
   /*  dbms_output.put_line(fname||' '||lname||' is billed for '||summ||' taka.');*/
      
     UPDATE ORDERINFO SET TOTAL =summ where Order_Id=:new.Order_Id; 
END;
/