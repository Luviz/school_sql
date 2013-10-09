use dv1454_ht13_5

Select * from accountlog

Drop Procedure SPSumAcc
Go
Create Procedure SPSumAcc
AS 
Begin
	SELECT Sum (balanceAccount) AS totBalance FROM account
	SELECT Sum (amountAccountLog) AS totBalance_log FROM accountlog
End;

exec SPSumAcc