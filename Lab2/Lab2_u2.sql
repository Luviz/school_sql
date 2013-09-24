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
	@OrderNr int,
	@Amount int,
	@result int output
AS 
Begin
	DECLARE @artPrice int 
	Set @artPrice = (Select price From Article Where nr = @ArtNr)
	IF @artPrice * @Amount < 1000
	Begin 
		set @result = 1
		Insert Into Orderline (ArtNr, OrderNr, Amount)values(@ArtNr, @OrderNr, @Amount)
	End
	ELSE
	Begin
		set @result = 0 
	End
End;



DECLARE @@result int = 0
EXEC spAddOrderline 20, 1001, 10, @@result OUTPUT
PRINT @@result -- bara för teständamål

SELECT * FROM Article
SELECT * FROM CustomOrder
SELECT * FROM OrderLine

Delete From OrderLine Where ArtNr = 20