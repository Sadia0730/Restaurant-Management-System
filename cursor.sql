SET SERVEROUTPUT ON
DECLARE
     CURSOR m_info IS
     SELECT Menu_Id, Quantity FROM MENUBILL where order_id =1;
     m_record  m_info%ROWTYPE;
     summ int;
     pr MENU.PRICE%type;
     item MENU.NAME%type;
BEGIN
summ:=0;
 dbms_output.put_line('Item'||'           '||'Quantity'||'           '||'price');
 dbms_output.put_line('-------------------------------------------');
OPEN m_info;
      LOOP
        FETCH m_info INTO m_record;
        EXIT WHEN m_info%NOTFOUND;
        select NAME, PRICE into item, pr from MENU where Menu_Id=m_record.Menu_Id;
       /* summ:=summ+m_record.Quantity*pr;*/
        dbms_output.put_line(item||'          '||m_record.Quantity||'              '||pr); 
        
      
      END LOOP;
      CLOSE m_info; 
     /* dbms_output.put_line(summ);  */
END;
/






/*create or replace trigger triggern 
before insert on Menubill
for each row
declare
CURSOR m_info IS
     SELECT Menu_Id, Quantity FROM MENUBILL where order_id =1;
     m_record  m_info%ROWTYPE;
     summ int;
     pr MENU.PRICE%type;
     item MENU.NAME%type;
begin
summ:=0;
 dbms_output.put_line('Item'||'           '||'Quantity'||'           '||'price');
 dbms_output.put_line('-------------------------------------------');
OPEN m_info;
      LOOP
        FETCH m_info INTO m_record;
        EXIT WHEN m_info%NOTFOUND;
        select NAME, PRICE into item, pr from MENU where Menu_Id=m_record.Menu_Id;
        summ:=summ+m_record.Quantity*pr;
        dbms_output.put_line(item||'   '||m_record.Quantity||'              '||pr); 
        
      
      END LOOP;
      CLOSE m_info; 
      dbms_output.put_line(summ);  
END;
/

*/