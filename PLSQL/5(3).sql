SET SERVEROUTPUT ON;
DECLARE
    
    CURSOR PARAM_CUR( ROLL number) IS SELECT RNO,SNAME,MAR FROM ST_M WHERE RNO = ROLL;
    TMP PARAM_CUR%ROWTYPE;
    A NUMBER;

BEGIN
    
    A := &A;
    
    FOR TMP IN PARAM_CUR(A)
        LOOP
            DBMS_OUTPUT.PUT_LINE('ROLL : '|| TMP.RNO ||' NAME : ' ||TMP.SNAME ||' MARKS : '||TMP.MAR);
        END LOOP;
    END;    