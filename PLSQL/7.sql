{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1033{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\*\generator Riched20 10.0.17134}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\f0\fs22\lang9 create or replace FUNCTION FUN_RES RETURN VARCHAR2 AS \par
\par
    rno st_m.rno%type;\par
    sn  st_m.sname%type;\par
    m   st_m.mar%type;\par
    res result.class1%type;\par
    \par
    cursor c2 is select RNO,SNAME,MAR from ST_M;\par
BEGIN\par
\par
    OPEN C2;\par
    LOOP\par
    FETCH C2 INTO RNO,SN,M;\par
    \par
    IF( M<=1500 AND M<=990) THEN\par
        RES := 'DISTINCTION';\par
    ELSIF ( M >= 850 AND M <= 989) THEN\par
        RES := 'FIRST CLASS';\par
    ELSE\par
        RES := 'FAIL';\par
    END IF;\par
    INSERT INTO RESULT VALUES(RNO,SN,RES);\par
    END LOOP;\par
    RETURN 'DONE';\par
    \par
END FUN_RES;\par
}
 