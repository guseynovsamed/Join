select * from Employees


alter table Employees add default 'XXX' for [Surname]


insert into Employees([Name],[Email])
values ('Anna','anna@gmail.com')


alter table Employees
add Age int check (Age > 18);


update Employees
set Age = 25
where Id=1;


update Employees
set Age = 30 
where Id=1002;


update Employees
set Age = 15
where Id=2;


insert into Employees([Name],[Age])
values ('Nurlan','19')



select Count(*) as 'Employee Count' from Employees


select Sum(Age) as 'Sum Age Employees' from Employees


select Avg(Age) as 'Sum avg Employees' from Employees

select Max(Age) as 'Employees max age' from Employees

select Min(Age) as 'Employees min age' from  Employees

select SUBSTRING('Semed',1,2) from Employees

select REPLACE('Semed','e','a')


select SUBSTRING([Surname],1,4) from Employees



declare @avAge int = (select AVG(Age) from Employees)


declare @sumAge int = (select Sum(Age) from Employees )

if @sumAge > @avAge
    print ' yes '
else
    print ' no '



SELECT CHARINDEX('@',[Email]) from Employees

SELECT * FROM Employees


drop table Countries



create table Countries(
    [Id] int primary key identity(1,1),
    [Name] nvarchar(50)
)


insert into Countries([Name])
values('Azerbaycan'),
       ('Turkiye'),
       ('Ispaniya'),
       ('Rusiya')



select * from Countries



create table Cities (
    [Id] int primary key identity(1,1),
    [Name] nvarchar (50),
    [CountryId] int
    foreign key (CountryId) references Countries(Id)    
)


select * from Cities where [CountryId]=1


insert into Cities([Name],[CountryId])
values ('Baku',1),
       ('Sirvan',1),
       ('Terter' ,1),
       ('Bursa',2),
       ('Ankara' ,2),
       ('Madrid',3),
       ('Moskva',4)



create table Students (
    [Id] int primary key identity(1,1),
    [FullName] nvarchar (50),
    [Email] nvarchar(100),
    [Address] nvarchar(100),
    [Age] int ,
    [CityId] int,
    foreign key (CityId) references Cities(Id)
)


select * from Students



insert into Students ([FullName] , [Email],[Address],[Age],[CityId])
values('Nurlan Veliyev' , 'nurlan@icloud.com' , 'Nermanov' , 20 , 1),
      ('Semed Huseynov' , 'semed@icloud.com' , 'Ehmedli' , 28 , 1),
      ('Aqsin Veliyev' , 'crazyboy@icloud.com' , 'Cadde' , 25 , 4),
      ('Ilham Abasli' , 'develop@icloud.com' , 'Anit merkez' , 20 , 5),
      ('Tunzanle Memmedova' , 'tunzala@icloud.com' , 'Balasixa' , 20 , 7),
      ('Elnur Memmedov' , 'mmdv@icloud.com' , 'Paloska' , 20 , 7),
      ('Zaur Huseynov' , 'zaur@icloud.com' , 'Edranto' , 20 , 6)





create table Teachers(
    [Id]int primary key identity(1,1),
    [FullName] nvarchar(100),
    [Salary] float,
    [Age] int,
    [CityId] int,
    foreign key (CityId) references Cities(Id)
)


insert into Teachers([FullName],[Salary],[Age],[CityId])
values('Cavid Basirli' , 3100 , 30 , 1),
      ('Suleyman Dadasov' , 3100 , 30 , 1),
      ('Emil Abdullayev' , 3100 , 30 , 1)


create table TeacherStudents(
    [Id] int primary key identity(1,1),
    [TeacherId] int,
    [StudentId] int,
    [CityId] int,
    foreign key (TeacherId) references Teachers(Id),
    foreign key (StudentId) references Students(Id)
)


insert into TeacherStudents([TeacherId],[StudentId])
values (1,1),
       (1,2),
       (2,1),
       (3,3),
       (2,4),
       (2,2)





select ct.Name as 'City', co.Name as 'Country' from Countries co
inner join Cities ct
on co.Id = ct.CountryId


select co.Name as 'Country' , ct.Name as 'City' from Countries co
left join Cities ct
on co.Id = ct.CountryId


select co.Name as 'Country' , ct.Name as 'City' from Countries co
right join Cities ct
on co.Id = ct.CountryId


select co.Name as 'Country' , ct.Name as 'City' from Countries co
full join Cities ct
on co.Id = ct.CountryId


select stu.FullName as 'Student FullName' , stu.Email'Student Email' , stu.Age as 'Student Age' , ct.Name as 'City' ,  co.Name as 'Country Name' , t.FullName as 'Teacher Name' from Students stu
join Cities ct
on ct.Id = stu.CityId 
join Countries co
on ct.CountryId = co.Id
join TeacherStudents ts
on stu.Id = ts.StudentId
join Teachers t
on t.id = ts.TeacherId
where t.id = 1     