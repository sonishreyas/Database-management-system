{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1033{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\*\generator Riched20 10.0.17134}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\f0\fs22\lang9 create or replace PROCEDURE PROC_GRADE AS\par
 \par
    R_NO st_m.rno%type;\par
    S_NAME st_m.sname%type;\par
    S_MARKS st_m.mar%type;\par
    res result.class1%TYPE;\par
    \par

\pard\sa200\sl276\slmult1\qj     CURSOR C1 IS SELECT RNO,SNAME,MAR FROM ST_M;\par
    \par
 BEGIN\par
    OPEN C1;\par
    LOOP\par
        FETCH C1 INTO R_NO,S_NAME,S_MARKS;\par
        EXIT WHEN C1%NOTFOUND;\par
        \par
        if(S_MARKS <= 1500 AND s_marks >= 990) then\par
            res := 'Distinction';\par
        Elsif(s_marks <= 989 and S_marks >= 940) then \par
            res := 'FIRST CLASS';\par
        ELSE\par
            res:= 'FAIL';\par
        END IF;\par
        \par
        INSERT INTO RESULT VALUES (R_NO,S_NAME,res);\par
        \par
    END LOOP;\par
   \par
    CLOSE C1;\par
    \par
END PROC_GRADE;\par
}
 