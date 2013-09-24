Create Function fTotalOrderValueLim(@v1 int , @v2 int) Returns FloatAs BeginReturn (Select Sum (totalPrice) From CustomOrder Where nr Between @v1 and @v2)endGoSelect * From CustomOrderDECLARE @@svar FLOAT
SET @@svar = dv1454_ht13_5.fTotalOrderValueLim(1001,1001)
PRINT 'Ordervärde: ' + STR(@@svar,10,2) -- bara för teständamål