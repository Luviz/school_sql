use dv1454_ht13_5

-- part 3
-- pk nr , fp boos -> employee.nr
Create Table Employee(
	Nr int primary key,
	eName varchar (20),
	BOSS int Foreign key References Employee(nr)
)

Insert Into Employee values (1,	'Johansson'	,NULL)
Insert Into Employee values (2,	'Åkesson'	,1)
Insert Into Employee values (3,	'Arvidsson'	,1)
Insert Into Employee values (4,	'Svensson'	,3)
Insert Into Employee values (5,	'Karlsson'	,3)
Insert Into Employee values (6,	'Lundin'	,4)

-- 2.
Select * from Employee Order by eName ASC
Select emp.ename, emp_boss.ename from Employee AS emp left outer join Employee AS emp_boss on emp.boss=emp_boss.nr


