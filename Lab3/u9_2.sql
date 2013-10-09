USE dv1454_ht13_5
----------------------------------
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
----------------------------------



---------------------------------
BEGIN TRANSACTION;

-- Reset the balance on account Anna
UPDATE Account SET balanceAccount = 0 WHERE nameAccount = 'Anna';

-- If lock proceed.
-------------------------------




-------------------------------



-------------------------------
SELECT * FROM Account WHERE nameAccount = 'Anna';

ROLLBACK;
--------------------------------