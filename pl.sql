DECLARE
 TYPE t_results IS TABLE OF MENU.PRICE%type INDEX BY pls_integer;
 TYPE t_results2 IS TABLE OF MENUBILL.QUANTITY%type INDEX BY pls_integer;
 TYPE t_results3 IS TABLE OF MENU.NAME%type INDEX BY pls_integer;
 v_results t_results;
 v_results2 t_results2;
 v_results3 t_results3;
 c_fname CUSTOMER.Fname%type;
 c_lname CUSTOMER.Lname%type;
 s float:=0;
procedure total(id ORDERINFO.Order_Id%type) is 
BEGIN
SELECT Fname,Lname into c_fname,c_lname from CUSTOMER where Customer_Id in (select Customer_Id from ORDERINFO where Order_Id=id);
SELECT PRICE,NAME BULK COLLECT INTO v_results,v_results3
          FROM MENU
          WHERE Menu_Id IN (Select Menu_Id FROM MENUBILL where Order_Id=id);
SELECT QUANTITY BULK COLLECT INTO v_results2
          FROM (SELECT * FROM MENUBill order by MENU_ID) 
          WHERE Order_Id=id;
 dbms_output.put_line('NAME'||CHR(9)||CHR(9)||CHR(9)||'PRICE'||CHR(9)||'Quantity');
FOR i IN v_results.FIRST .. v_results.LAST
LOOP
    FOR    j in v_results2.FIRST .. v_results2.LAST
    LOOP
          FOR    k in v_results3.FIRST .. v_results3.LAST
          LOOP
                    if (i=j)
                    then
                        if(j=k)
                        then
                        s:=s+v_results(i)*v_results2(j);
                        dbms_output.put_line(v_results3(k)||CHR(9)||CHR(9)||v_results(i)||CHR(9)||CHR(9)||v_results2(j));
                    end if;
                        end if;
   
          END LOOP;
    END LOOP;
END LOOP;
dbms_output.put_line(chr(13)||chr(10));
dbms_output.put_line(c_fname ||'  '|| c_lname||' billed for ' || s || ' Taka');
END;

begin 

total(2);
END;



