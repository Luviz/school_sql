use dv1454_ht13_5

SELECT * FROM Article
SELECT * FROM CustomOrder
SELECT * FROM OrderLine

Select ArtNr, CustomerName, TotalPrice from OrderLine inner join CustomOrder on OrderLine.OrderNr=CustomOrder.nr
Select * from OrderLine inner join CustomOrder on OrderLine.OrderNr=CustomOrder.nr


Drop Procedure spAddOrderLine
Go
Create Procedure spAddOrderLine
	@ArtNr int,
	@ 
As Begin
	@result int = 0
	@result = 1 where Select TotalPrice from OrderLine inner join CustomOrder on OrderLine.OrderNr=CustomOrder.nr < 1000
End




DECLARE @@result int
 
EXEC spAddOrderline 20,1001,10, @@result OUTPUT
PRINT @@result -- bara för teständamål