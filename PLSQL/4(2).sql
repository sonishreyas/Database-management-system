SET SERVEROUTPUT ON;

DECLARE

    CURSOR FOR_CUR IS SELECT RNO,SNAME,MAR FROM ST_M;
    TMP FOR_CUR%ROWTYPE;
    
BEGIN
    
    FOR TMP IN FOR_CUR
    LOOP
        DBMS_OUTPUT.PUT_LINE('ROLL : '|| TMP.RNO || ' NAME : '|| TMP.SNAME|| ' MARKS : '|| TMP.MAR);
    END LOOP;
    
END;
