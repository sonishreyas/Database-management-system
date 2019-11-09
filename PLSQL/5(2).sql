BEGIN
    MERGE INTO T1 USING T2 ON (T1.ROLLNO = T2.RNO)
    WHEN NOT MATCHED THEN INSERT (ROLLNO) VALUES(T2.RNO);
    
    IF SQL % FOUND THEN
        DBMS_OUTPUT.PUT_LINE('MERGED');
    END IF;
    IF SQL % NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('NOT MERGED');
    END IF;
    IF SQL % ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE(SQL % ROWCOUNT || ' ROWS UPDATED');
    END IF;
END;    
    