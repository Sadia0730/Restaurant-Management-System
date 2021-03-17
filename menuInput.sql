set serveroutput on
Declare
    f utl_file.file_type;
    line varchar(1000);
    cid MENU.Menu_id%type;
    item MENU.Name%type;
    price MENU.Price%type;
    ratio MENU.ratio%type;
    category MENU.category%type;
   
    
    
Begin
    f := utl_file.fopen('CSE','menu.csv','r');
    if utl_file.is_open(f) then
        utl_file.get_line(f,line,1000);
        loop begin
        utl_file.get_line(f,line,1000);
        cid := regexp_substr(line,'[^,]+',1,1);
        item := regexp_substr(line,'[^,]+',1,2);
        price := regexp_substr(line,'[^,]+',1,3);
        ratio := regexp_substr(line,'[^,]+',1,4);
        category:= regexp_substr(line,'[^,]+',1,5);
        
        insert into MENU(Menu_Id,Name,Price,Ratio,Category)
        values(cid,item,price,ratio,category);
      /*  insert into cstmr(id,name,age) values (id,name,age);*/
        if line is null then exit;
        end if;
        exception when no_data_found then exit;
        end;
        end loop;
    end if;
end;
/
    