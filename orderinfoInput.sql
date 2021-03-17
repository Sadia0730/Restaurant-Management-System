set serveroutput on
Declare
    f utl_file.file_type;
    line varchar(1000);
    oid ORDERINFO.Order_id%type;
    custid CUSTOMER.Customer_Id%type;
    wid WAITER.Waiter_Id%type;
    total ORDERINFO.Total%type;
    
   
    
    
Begin
    f := utl_file.fopen('CSE','orderinfo.csv','r');
    if utl_file.is_open(f) then
        utl_file.get_line(f,line,1000);
        loop begin
        utl_file.get_line(f,line,1000);
        oid := regexp_substr(line,'[^,]+',1,1);
        custid := regexp_substr(line,'[^,]+',1,2);
        wid := regexp_substr(line,'[^,]+',1,3);
        total := regexp_substr(line,'[^,]+',1,4);
        
        
        insert into ORDERINFO(Order_id,Customer_Id,Waiter_Id,Total)
        values(oid,custid,wid,total);
      /*  insert into cstmr(id,name,age) values (id,name,age);*/
        if line is null then exit;
        end if;
        exception when no_data_found then exit;
        end;
        end loop;
    end if;
end;
/
    