USE dv1454_ht13_5

SELECT * FROM account
SELECT * FROM accountlog

UPDATE account SET balanceAccount = 500
		WHERE nameAccount = 'Nils'


DROP PROCEDURE SPWithdraw	
GO		
CREATE PROCEDURE SPWithdraw 
	@nrAcc INT,
	@amount INT
AS
BEGIN
	PRINT @nrAcc
	PRINT @amount
	BEGIN TRANSACTION
	UPDATE account SET balanceAccount = balanceAccount-@amount
			WHERE NRAccount = @nrAcc
	IF 0 < (SELECT balanceAccount FROM account WHERE nrAccount = @nrAcc)
	BEGIN
		COMMIT TRANSACTION
	END
	ELSE BEGIN
		ROLLBACK TRANSACTION
	END	
END


SELECT * FROM account
EXEC SPWithdraw 1, 6000
SELECT * FROM account

EXEC SPWithdraw 1, 400
SELECT * FROM account