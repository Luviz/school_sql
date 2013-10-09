USE dv1454_ht13_5
SELECT * FROM account
SELECT * FROM accountlog

-- 1
--	NILS withdraws 300

BEGIN	TRANSACTION
	UPDATE account SET balanceAccount = balanceAccount-300
		WHERE nameAccount = 'Nils'
	INSERT INTO accountlog VALUES (1,GETDATE(),-300)
COMMIT	TRANSACTION

SELECT * FROM account
SELECT * FROM accountlog
exec SPSumAcc

--2 

BEGIN	TRANSACTION
	UPDATE account SET balanceAccount = balanceAccount+300
		WHERE nameAccount = 'Nils'
	INSERT INTO accountlog VALUES (1,GETDATE(),300)
COMMIT	TRANSACTION

SELECT * FROM account
SELECT * FROM accountlog
exec SPSumAcc

