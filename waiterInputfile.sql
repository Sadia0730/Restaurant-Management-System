set serveroutput on
Declare
    f utl_file.file_type;
    line varchar(1000);
    cid waiter.Waiter_id%type;
    fname waiter.Fname%type;
    lname waiter.Lname%type;
    contact waiter.Contact%type;
    address waiter.address%type;
    salary waiter.salary%type;
    joinDate waiter.join_date%type;
    
    
Begin
    f := utl_file.fopen('CSE','waiter.csv','r');
    if utl_file.is_open(f) then
        utl_file.get_line(f,line,1000);
        loop begin
        utl_file.get_line(f,line,1000);
        cid := regexp_substr(line,'[^,]+',1,1);
        fname := regexp_substr(line,'[^,]+',1,2);
        lname := regexp_substr(line,'[^,]+',1,3);
        contact := regexp_substr(line,'[^,]+',1,4);
        address:= regexp_substr(line,'[^,]+',1,5);
        salary := regexp_substr(line,'[^,]+',1,6);
       joinDate:=to_date(regexp_substr(line,'[^,]+',1,7),'dd/mm/yyyy');
        insert into WAITER(Waiter_Id,Fname,Lname,Contact,Address,Salary,Join_date)
        values(cid,fname,lname,contact,address,salary,joinDate);
      
        if line is null then exit;
        end if;
        exception when no_data_found then exit;
        end;
        end loop;
    end if;
end;
/
    