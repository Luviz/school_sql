USE dv1454_ht13_5

SELECT * FROM account
SELECT * FROM accountlog
EXEC SPSumAcc


--1
BEGIN TRANSACTION 
	UPDATE account SET balanceAccount = balanceAccount-300
		WHERE nameAccount = 'Nils'
	INSERT INTO accountlog VALUES (1,GETDATE(),-20)	--2
	SELECT * FROM account
	SELECT * FROM accountlog
	EXEC SPSumAcc

COMMIT	TRANSACTION 

BEGIN TRANSACTION 
	UPDATE account SET balanceAccount = balanceAccount-300
		WHERE nameAccount = 'Nils'
	INSERT INTO accountlog VALUES (1,GETDATE(),-20)
	SELECT * FROM account
	SELECT * FROM accountlog
	EXEC SPSumAcc

ROLLBACK TRANSACTION 

--3