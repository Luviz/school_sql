USE dv1454_ht13_5







----------------------
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT * FROM VBalance;
-- If lock then cancel
---------------------------------------------
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT * FROM VBalance;
-- Ingvar has 500 on his account
---------------------------------------------
-- Ingvar takes out 500 on the ATM
UPDATE Account SET balanceAccount = balanceAccount - 500 WHERE nameAccount = 'Ingvar';
-- if lock, proceed with next step.
---------------------------------------------




------------------------------------------------
SELECT * FROM account