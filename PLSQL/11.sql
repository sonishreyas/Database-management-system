{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1033{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\*\generator Riched20 10.0.17134}\viewkind4\uc1 
\pard\sa200\sl240\slmult1\f0\fs24\lang9\par
\par
Chit 11. Database Trigger (Row level, Before Trigger). Write a database trigger on Library table. The System should keep track of the records that are being updated or deleted. The old value of updated or deleted records should be added in Library_Audit table\par
\ul\b TRIGGER\par
\ulnone\b0 CREATE OR REPLACE TRIGGER LIB \par
BEFORE DELETE OR INSERT OR UPDATE OF BOOKID,PRICE,BOOKNAME ON LIBRARY \par
REFERENCING OLD AS OLD NEW AS NEW \par
FOR EACH ROW \par
BEGIN\par
  INSERT INTO LIBRAR_AUDIT VALUES(:OLD.BOOKID,:OLD.PRICE);\par
END;\par
\ul\b\par
WORKSHEET\par
\par
\ulnone\b0 update LIBRARY set PRICE = 100 where BOOKID = 1;\par
}
 