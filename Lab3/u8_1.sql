USE dv1454_ht13_5

BEGIN TRANSACTION; 

UPDATE Account SET balanceAccount = balanceAccount - 500 WHERE nameAccount = 'Anna';
UPDATE Account SET balanceAccount = balanceAccount + 500 WHERE nameAccount = 'Ingvar';

SELECT * FROM VBalance;
---------------------------------------------------




--------------------------------------------------




--------------------------------------------------



---------------------------------------------------
-- Anna can not ge below 0, rollback
ROLLBACK;

SELECT * FROM VBalance;
-------------------------------------------------
