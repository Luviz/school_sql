Create Function fTotalOrderValue() Returns FloatAs Begin	Return (Select Sum (totalPrice) From CustomOrder)endGoSelect * From CustomOrderDECLARE @@svar FLOAT
SET @@svar = dv1454_ht13_5.fTotalOrderValue()
PRINT 'Orderv�rde: ' + STR(@@svar,10,2) -- bara f�r test�ndam�l