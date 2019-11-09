SET SERVEROUTPUT ON;

DECLARE
    
    ROLL INTEGER;
    AMT INTEGER;
    NOD INTEGER;
    DOI DATE;
    BN VARCHAR2(20);
    
BEGIN
    
    ROLL := &ROLL;
    BN := '&BN';
    
    SELECT DOI into DOI from TABLE1 where ROLLNUM = ROLL AND BNAME = BN;
    
    NOD := SYSDATE - DOI;
    
    if (NOD > 30) THEN
        AMT := NOD * 50;
    elsif (NOD > 15 AND NOD <30) THEN
        AMT := NOD * 5;
    ELSE
        DBMS_OUTPUT.PUT_LINE('NO FINE');
    END IF;
    
    IF (NOD > 15) THEN
        INSERT INTO TABLE2 VALUES(ROLL,SYSDATE,AMT);
    END IF;    
    
    UPDATE table1 SET STA = 'R' WHERE ROLLNUM = ROLL AND BNAME = BN;
    
    EXCEPTION
    WHEN NO_DATA_FOUND then
        dbms_output.put_line('NO RECORD FOUND');
    when others then
        DBMS_OUTPUT.PUT_LINE('ERROR');
END;
    