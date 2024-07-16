
CREATE DATABASE Library;
CREATE TABLE Books(
    BookID int IDENTITY(1,1) ,
    Title varchar(15),
    AuthorID int,
    PublishedYear int,
    CopiesAvailable varchar(15),
    BookCategory varchar(15)
);


CREATE TABLE Authors(

AuthorID int PRIMARY KEY IDENTITY(1,1),
FirstName varchar(20),
LastName varchar(20),
BirthYear date

);
INSERT INTO Books
VALUES ('Harry Potter', 1, 2022, '60', 'movies'),
 ('Harry Potter', 1, 2024, '200', 'movies'),
  ('Harry Potter', 1, 2020, '100', 'movies'),
   ('Harry Potter', 1, 2021, '500', 'movies');


   INSERT INTO Authors
VALUES ('Jonas', 'stetheman','1990-05-22'),
('Jonas', 'stetheman','1990-05-22'),
('Jonas', 'stetheman','1990-05-22'),
('Jonas', 'stetheman','1990-05-22'),
('Jonas', 'stetheman','1990-05-22');
--1- Display All Books and Authors: ( Query to retrieve and print details of all books along with their respective authors).
select * from Books;
select * from Authors;

--2-  Book Availability: ( Query to show the book with the highest and lowest number of available copies )

select MIN(CopiesAvailable) minumumvalue from Books;
select MAX(CopiesAvailable)as maximumvalue from Books;

--3- Average Publication Year:( Query to calculate and display the average publication year of books in the library )

select AVG(PublishedYear) as average from Books;

--4- Total Books Count:( Query to count and print the total number of books in the library )

select count(BookID) as CountBooks from Books;


--5- Empty Books Table ( i just need make Books Table with out any record )

TRUNCATE TABLE Books;

--6- Delete Authors Table (هاي واضحه خلص زهقت بديش اكتب كمان  )

DROP TABLE Authors;



/*The task for today :

As a SQL developer you are responsible for building the database for the new project, where the project is School System contains the following tables : ( Teachers, TeacherDetails, Courses, Students ).
So you have to create these tables with the appropriate fields in each one of them and create the correct relationship between them to be logically and functionally Right ,and after that insert at least Five records in each table .*/


CREATE DATABASE School ;

CREATE TABLE Teachers(
ID_Teacher int PRIMARY KEY identity(1,1),
UserName varchar(15)

);

CREATE TABLE  Students1(
ID_Student int PRIMARY KEY identity(1,1),
Name varchar(20),



);


CREATE TABLE Courses(
ID_Course int PRIMARY KEY identity(1,1),
Name varchar(20)


);

CREATE TABLE Students_Courses (
ID_Student int,
ID_Course int,
PRIMARY KEY(ID_Student,ID_Course),
FOREIGN KEY (ID_Student) REFERENCES Students1(ID_Student),
FOREIGN KEY (ID_Course) REFERENCES Courses(ID_Course),


);


CREATE TABLE TeacherDetails(
Id_details int primary key identity(1,1),
ID_Teacher int UNIQUE,
ID_Course int unique,
Addresse varchar(50),
Phone varchar(20),
FOREIGN KEY (ID_Teacher) REFERENCES Teachers(ID_Teacher),
FOREIGN KEY (ID_Course) REFERENCES Courses(ID_Course)

);



   INSERT INTO Teachers
VALUES ('mohammad'),
('ahmad'),
('marieam'),
('sobhi'),
('hamodeh');




   INSERT INTO TeacherDetails
VALUES (1,1,'irbid', '0798323232233'),
(2,2,'amman', '0798323232233'),
(3,3,'romtha', '0798323232233'),
(4,4,'alsareih', '0798323232233'),
(5,5,'mafraq', '0798323232233');




   INSERT INTO Courses
VALUES ('math'),
('phisics'),
('arabic'),
('english'),
('chemestry');





   INSERT INTO Students1
VALUES ('bassam'),
('ahmad'),
('barhoom'),
('ibrahiem'),
('rahooba');


  INSERT INTO Students_Courses
VALUES (1,1),
(1,2),
(1,3),
(2,4),
(4,3);












