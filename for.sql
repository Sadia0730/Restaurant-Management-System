SET SERVEROUTPUT ON
DECLARE
   counter    NUMBER(2);
   name       WAITER.Fname%TYPE;
   surname    Waiter.Lname%TYPE;
  
BEGIN

   FOR counter IN 1..3 
   LOOP

      SELECT Fname, Lname 
      INTO name, surname
      FROM Waiter
      WHERE
      Waiter_id = counter;

      DBMS_OUTPUT.PUT_LINE ('Record ' || counter);
      DBMS_OUTPUT.PUT_LINE (name || '-' || surname);
      DBMS_OUTPUT.PUT_LINE ('-----------');
   END LOOP;

   EXCEPTION
      WHEN others THEN
         DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
