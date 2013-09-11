
use dv1454_ht13_5

Drop Table SP
Drop table S
Drop Table P


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
	price float 
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

Select * from s
Select * from p
Select * from sp

-- part 2 
-- 1.1
Delete From s Where sName = 'adams'

Select * from s
Select * from p
Select * from sp
-- due to the lacke of deviveris adams did not desturb the System
-- 1.2
Select * from s
Update s Set city = 'Hallabro' Where sName = 'Jones' 
-- 1.3
Select * from s
Update s Set city = 'Tingsryd' Where city = 'London'
Select * from s

-- 1.4
Insert Into S values (5, 'Jackson', 'Stockholm')
Select * from s

-- 1.5 
Select * from p 
update p Set price = price/10
Select * from p

-- 1.6

Select * from p 
update p Set weight_ = weight_+2 where colour = 'red'
Select * from p

-- 2 VIEW
-- 2.1
Create View VRedProducts as Select * from p Where colour = 'red'
Select * From VRedProducts
-- 2.2
Select * from sp inner join VRedProducts on sp.p=VRedProducts.p
-- 2.3
Create View VTotalWeight as Select sum(weight_) as VTtotalWeight from p 
Select * from VTotalWeight
-- 2.4
Select * from p
Insert Into VRedProducts values (7, 'Spike', 'red', 12, 20)
Select * from p
-- 2.5
Select * from VTotalWeight
-- 2.6
-- this is not going to worker to to the view being a sum an other table 
--	so when incceing the sum of the total the software is not going to and to devide the mass  equvilly
--	and it runs unesption
Insert Into VRedProducts values (100)


-- 3 DROP
Drop table p
-- table p is connecte to tabel sp
Delete From s
Select * from s
Select * from p
Select * from sp

--Droping removes the tabel but deleting remove the connten of that tabel
