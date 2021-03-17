set serveroutput on
Declare
   
     
     
procedure billgenerate (k ORDERINFO.Order_id%type) as 
  f utl_file.file_type;
     CURSOR m_info IS
     SELECT Menu_Id, Quantity FROM MENUBILL where order_id =k;
     pr MENU.PRICE%type;
     item MENU.NAME%type;
     summ ORDERINFO.TOTAL%type;
     fname CUSTOMER.FNAME%type;
     lname CUSTOMER.LNAME%type;
     dat date;
     

Begin
    f := utl_file.fopen('CSE','cusst_update.txt','w');
     /*date */
    utl_file.put(f,sysdate);
    utl_file.new_line(f);
    utl_file.new_line(f);
    /*customer name*/
    select Fname,Lname into fname,lname from customer where Customer_Id in(SELECT customer_Id from ORDERINFO where Order_Id=k);
    utl_file.put(f,'Customer Name: '||fname||' '||lname);
    utl_file.new_line(f);
    utl_file.new_line(f);
    
    /*waiter name*/
    select Fname,Lname into fname,lname from Waiter where waiter_Id in(SELECT waiter_Id from ORDERINFO where Order_Id=k);
    utl_file.put(f,'Served by '||fname||' '||lname);
    utl_file.new_line(f);
    
    /*item list*/
    utl_file.put(f,'Item' || chr(9) || 'Quantity' || chr(9) || 'Unit Price'||chr(9)||'Price');
    utl_file.new_line(f);
    for c_record in m_info
        loop
            select NAME, PRICE into item, pr from MENU where Menu_Id=c_record.Menu_Id;
            utl_file.put(f,item || chr(9) || pr || chr(9) || c_record.quantity||chr(9)|| c_record.quantity*pr);
            utl_file.new_line(f);
        end loop;
        SELECT Total into summ FROM ORDERINFO WHERE order_Id=k;
        
        utl_file.put(f,'Total Bill: '||summ||' Taka');
        utl_file.fclose(f);
end;

begin
	billgenerate(1);
end;


/