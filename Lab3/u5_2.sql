use dv1454_ht13_5

BEGIN TRANSACTION

UPDATE account SET balanceAccount = balanceAccount -3000 WHERE nrAccount = 1

SELECT * FROM account 

------------------------------------

------------------------------------
ROLLBACK;
------------------------------------

-----------------------------------
SELECT * FROM account

--the end

BEGIN TRANSACTION; 

UPDATE Account
SET balanceAccount = balanceAccount - 3000
WHERE nrAccount = 1;

SELECT * FROM Account;
------------------------------------------------


------------------------------------------------
SELECT * FROM account 
COMMIT
------------------------------------------------

------------------------------------------------
SELECT * FROM account 
---The END?