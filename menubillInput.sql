set serveroutput on
Declare
    f utl_file.file_type;
    line varchar(1000);
    cid ORDERINFO.Order_id%type;
    menuid MENU.Menu_id%type;
    quantity MENUBILL.Quantity%type;
  
   
    
    
Begin
    f := utl_file.fopen('CSE','menubill.csv','r');
    if utl_file.is_open(f) then
        utl_file.get_line(f,line,1000);
        loop begin
        utl_file.get_line(f,line,1000);
        cid := regexp_substr(line,'[^,]+',1,1);
        menuid := regexp_substr(line,'[^,]+',1,2);
        quantity := regexp_substr(line,'[^,]+',1,3);
        
        
        insert into MENU(Order_Id,Menu_Id,Quantity)
        values(cid,menuid,quantity);
      /*  insert into cstmr(id,name,age) values (id,name,age);*/
        if line is null then exit;
        end if;
        exception when no_data_found then exit;
        end;
        end loop;
    end if;
end;
/
    