USE dv1454_ht13_5
------------------------------
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
------------------------------
BEGIN TRANSACTION; -- BEGIN if MS SQL Server

SELECT * FROM Account WHERE nameAccount = 'Anna';
------------------------------------






-----------------------------------

UPDATE Account SET balanceAccount = 0 WHERE nameAccount = 'Anna';

-- Deadlock aquired and detected?
----------------------------------
SELECT * FROM Account WHERE nameAccount = 'Anna';

-- If lock proceed.
---------------------------------



--------------------------------
ROLLBACK
