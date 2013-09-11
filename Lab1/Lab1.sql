use dv1454_ht13_5
/*	
	1.	
		1-
			PK for S is s 
			PK for P is p
			PK for SP is S.s och P.p
*/

--2.
--	1-
--	s

Drop table S
Drop Table P
Drop Table SP

Create Table S(
	s int primary key,
	sName varchar (20),
	city varchar (20)
) 

Create Table P(
	p integer primary key,
	pName varchar (20),
	colour varchar (20),
	weight_ integer,
	price int 
)

Create Table SP(
	S integer Foreign key References S(s),
	P integer Foreign key References P(p),
	QTY int
)


Insert Into S values (1, 'Smith', 'London')
Insert Into S values (2, 'Jones', 'Paris')
Insert Into S values (3, 'Blake', 'Paris')
Insert Into S values (4, 'Clark', 'London')
Insert Into S values (5, 'Adams', 'Athens')

Insert Into P values (1, 'Nut', 'Red', 12 , 45)
Insert Into P values (2, 'Blot', 'Green', 17 , 23)
Insert Into P values (3, 'Screw', 'Blue', 17, 12)
Insert Into P values (4, 'Screw', 'Red', 14, 40)
Insert Into P values (5, 'Cam', 'Blue', 12, 44)
Insert Into P values (6, 'Cog', 'Red', 19, 12)

Insert Into SP values(1,1,300)
Insert Into SP values(1,2,200)
Insert Into SP values(1,3,400)
Insert Into SP values(1,4,200)
Insert Into SP values(1,5,100)
Insert Into SP values(1,6,100)

Insert Into SP values(2,1,300)
Insert Into SP values(2,2,400)

Insert Into SP values(3,2,200)

Insert Into SP values(4,2,200)
Insert Into SP values(4,4,300)
Insert Into SP values(4,5,400)

--3
Select *from S
Select *from P
Select *from SP

Select *from S Order By sName
Select *from P Order By pName

Select sName from S

Select sName from S Where city = 'London'

Select * from  p Where weight_ <15

Select * from  p Where price > 20 and colour = 'red'

Select * from  p Where price > 43 and colour = 'red' and weight_ < 13

-- 4
Select * from p

Select sum(weight_) From p;
Select avg(price) From p;
Select avg(price) From p Where colour = 'Green'
Select sum(weight_) From p Group by colour

-- 5

Select * from p
Select * from sp

Select * from SP cross join p
Select * from SP inner join P on sp.P=p.p
Select sName from s inner join sp on s.s=sp.s where sp.QTY>200
Select Distinct sName from s inner join sp on s.s=sp.s where sp.QTY>200
Select * from s inner join sp on s.s=sp.s where sp.QTY>200 and city = 'Paris'

-- 6
Select * From sp

Select * From sp inner join p on sp.p=p.p Where QTY >= 300
Select Distinct pName From sp inner join p on sp.p=p.p Where QTY >= 300
-- 6.3
Select * From sp inner join p on sp.p=p.p inner join s on sp.s=s.s
Select sname, pname, qty From sp inner join p on sp.p=p.p inner join s on sp.s=s.s


-- 7
Select * from s
Select * from sp

Select sName, qty from sp inner join s on sp.s=s.s
--supper adms has not been sending anything 
Select sName, qty from sp right outer join s on sp.s=s.s
Select sName, qty from sp left outer join s on sp.s=s.s

-- 8
Select sName, qty from sp right outer join s on sp.s=s.s where qty > 100
Select sName, qty from sp right outer join s on sp.s=s.s where qty =(Select Max(qty) From sp)

-- 9
Select * From p 
Select * From p where weight_ = 17 or  weight_ = 14 or weight_ = 12
Select * From p where weight_ in (17,14,12)
Select * From p where not weight_ in (17,14,10)

-- 10 
Select * From p where price between 40 and 50
Select pName From p where weight_ between 14 and 18
Select sName, pName, qty From sp inner join p on sp.p = p.p inner join s on sp.s= s.s where city = 'London' and weight_ between 14 and 18

-- 11
select * from sp
Select sName , sum(qty) from sp right outer join s on sp.s = s.s Group by sName
select * from sp inner join p on sp.p = p.p where colour in ('blue', 'green')
Select sName , sum(qty)  from sp right outer join s on sp.s = s.s inner join p on sp.p = p.p where colour = 'blue' Group by sName 
Select sName , sum(qty)  from sp right outer join s on sp.s = s.s inner join p on sp.p = p.p where colour = 'green' Group by sName 
