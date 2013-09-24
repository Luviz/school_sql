Create Trigger OrderSum On OrderLine After Insert
As Begin 
	DECLARE @artPrice int,
		@artAmount int 
	Set @artAmount = (Select amount From inserted)
	Set @artPrice = (Select price From Article Where nr = (Select artnr From inserted))
	Update CustomOrder Set 
		totalPrice += (@artPrice * @artAmount)
		
End;

Select * From OrderLine
Select * From CustomOrder
Insert Into Orderline (ArtNr, OrderNr, Amount)values(50, 1001, 24)

Select * From OrderLine
Select * From CustomOrder
