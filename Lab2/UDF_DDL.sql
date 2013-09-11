/*

Skript till Laborationen 2 UDF (User Defined Functions).

Studera och kör nedanstående skript. Du får gärna lägga till fler artiklar och order.

2011-04-12

*/

--//// Nedanstående rader kan du ha användning för om du har en egen server //////////////////
--USE Master
--GO
--DROP Database UDF_lab
--GO
--CREATE Database UDF_lab
--GO
--USE UDF_lab
--GO
--///////////////////////////////////////////

--DROP TABLE Article
use dv1454_ht13_5
GO
CREATE TABLE Article
(
	Nr int PRIMARY KEY,
	ArtName VARCHAR(20) NOT NULL UNIQUE,
	Price FLOAT DEFAULT 0
)

--DROP TABLE CustomOrder
GO
CREATE TABLE CustomOrder
(
	Nr int PRIMARY KEY,
	CustomerName VARCHAR(30) NOT NULL UNIQUE,
	TotalPrice FLOAT DEFAULT 0
)

--DROP TABLE OrderLine
GO
CREATE TABLE OrderLine
(
	ArtNr int,
	OrderNr int,
	Amount int,
	PRIMARY KEY (ArtNr, OrderNr),
	CONSTRAINT fkOrderLine_Article
	FOREIGN KEY (ArtNr) REFERENCES Article(Nr),
	CONSTRAINT fkOrderLine_CustomOrder
	FOREIGN KEY (OrderNr) REFERENCES CustomOrder(Nr)
)

---------------------------------------------------------------------------------------
-- lägg gärna till fler artiklar här
-- Insert articles
INSERT INTO Article (Nr, ArtName, Price)
VALUES (10, 'Penna', 4.50)
INSERT INTO Article (Nr, ArtName, Price)
VALUES (20, 'Radergummi', 0.50)
INSERT INTO Article (Nr, ArtName, Price)
VALUES (30, 'Kollegieblock', 15.00)
INSERT INTO Article (Nr, ArtName, Price)
VALUES (40, 'Gaffelpärm', 23.25)
INSERT INTO Article (Nr, ArtName, Price)
VALUES (50, 'Plastmapp', 2.50)

--SELECT * FROM Article

--Insert two orders
INSERT INTO CustomOrder (Nr, CustomerName, TotalPrice)
VALUES (1000, 'Studentbokhandeln', 0)
INSERT INTO CustomOrder (Nr, CustomerName, TotalPrice)
VALUES (1001, 'BTH', 0)

--SELECT * FROM CustomOrder

--Insert some ordelines
INSERT INTO OrderLine (ArtNr, OrderNr, Amount)
VALUES (10, 1000, 100)

INSERT INTO OrderLine (ArtNr, OrderNr, Amount)
VALUES (20, 1000, 200)

INSERT INTO OrderLine (ArtNr, OrderNr, Amount)
VALUES (40, 1000, 5)

INSERT INTO OrderLine (ArtNr, OrderNr, Amount)
VALUES (40, 1001, 10)

--Update the CustomOrder table with the total amounts
UPDATE CustomOrder 
SET TotalPrice = 666.25
WHERE Nr = 1000

UPDATE CustomOrder 
SET TotalPrice = 232.25
WHERE Nr = 1001

SELECT * FROM Article
SELECT * FROM CustomOrder
SELECT * FROM OrderLine

---------------------------------------------------------------------------------------

 -- END --
