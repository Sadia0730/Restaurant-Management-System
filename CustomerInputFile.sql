set serveroutput on
Declare
    f utl_file.file_type;
    line varchar(1000);
    cid customer.customer_id%type;
    fname customer.Fname%type;
    lname customer.Lname%type;
    contact customer.Contact%type;
    email customer.Email_Id%type;
    
Begin
    f := utl_file.fopen('CSE','Database.csv','r');
    if utl_file.is_open(f) then
        utl_file.get_line(f,line,1000);
        loop begin
        utl_file.get_line(f,line,1000);
        cid := regexp_substr(line,'[^,]+',1,1);
        fname := regexp_substr(line,'[^,]+',1,2);
        lname := regexp_substr(line,'[^,]+',1,3);
        contact := regexp_substr(line,'[^,]+',1,4);
        email := regexp_substr(line,'[^,]+',1,5);
        insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
        values(cid,fname,lname,contact,email);
      /*  insert into cstmr(id,name,age) values (id,name,age);*/
        if line is null then exit;
        end if;
        exception when no_data_found then exit;
        end;
        end loop;
    end if;
end;
/
    