use dv1454_ht13_5
-- Reset the balance on account Anna and Ingvar
UPDATE Account SET balanceAccount = 300 WHERE nameAccount = 'Anna';
UPDATE Account SET balanceAccount =   0 WHERE nameAccount = 'Ingvar';

-- Create a view to make easy checkup on balance
GO
CREATE VIEW VBalance
AS
   SELECT * FROM Account WHERE nameAccount = 'Anna' OR nameAccount = 'Ingvar';
GO
SELECT * FROM VBalance;
