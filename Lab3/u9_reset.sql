USE dv1454_ht13_5

-- Reset the balance on account Anna
UPDATE Account SET balanceAccount = 100 WHERE nameAccount = 'Anna';

-- Perform rollback in both clients to ensure that no transaction is ongoing
ROLLBACK;
