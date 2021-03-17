declare 
type namearray is varray(12) of MENU.NAME%type;
t_name namearray :=namearray();
counter number(2);
begin
for counter in 1..6
loop
t_name.extend;
select name into t_name(counter) from menu where menu_id=counter;
end loop;

for counter in 1..6
loop
dbms_output.put_line(counter||'.'||t_name(counter));
end loop;
end;
