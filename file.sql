set serveroutput on
Declare
    f utl_file.file_type;
    line varchar(1000);
    id cstmr.id%type;
    name cstmr.name%type;
    age cstmr.age%type;
Begin
    f := utl_file.fopen('CSE','Database.csv','r');
    if utl_file.is_open(f) then
        utl_file.get_line(f,line,1000);
        loop begin
        utl_file.get_line(f,line,1000);
        id := regexp_substr(line,'[^,]+',1,1);
        name := regexp_substr(line,'[^,]+',1,2);
        age := regexp_substr(line,'[^,]+',1,3);
        insert into CUSTOMER(Customer_Id,Fname,Lname,Contact,Email_Id)
        values(id,fname,lname,contact,email);
        insert into cstmr(id,name,age) values (id,name,age);
        if line is null then exit;
        end if;
        exception when no_data_found then exit;
        end;
        end loop;
    end if;
end;
/
    