SET SERVEROUTPUT ON;

DECLARE
    
    ROLL INTEGER;
    ATT INTEGER;
    STAT VARCHAR2(10);
BEGIN
    
    ROLL := &ROLL;
    SELECT ATT INTO ATT FROM STUD WHERE ROLLNO = ROLL;
    
    IF (ATT < 75) THEN
        dbms_output.put_line('detained');
        STAT := 'D';
    ELSE
        STAT := 'ND';
        DBMS_OUTPUT.PUT_LINE('NOT DETAINED');
    END IF;
    
    UPDATE STUD SET STA = STAT WHERE ROLLNO = ROLL;
    
EXCEPTION
WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('NO RECORD PRESENT');
WHEN OTHERS THEN
    dbms_output.put_line('ERROR');
 END;   