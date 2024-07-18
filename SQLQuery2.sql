CREATE DATABASE jaradat_Tech_solution;



CREATE TABLE Authors(
ID_Author int primary key identity(1,1),
Name_Authors varchar(15)


);


CREATE TABLE  Categories (
ID_Categories  int primary key identity(1,1),
Name_Categories  varchar(15),


);


CREATE TABLE Books(
ID_Book int primary key IDENTITY(1,1),
Name_Book varchar(15),
ID_Author int ,
ID_Categories int,
FOREIGN KEY (ID_Categories) REFERENCES Categories(ID_Categories),
FOREIGN KEY (ID_Author) REFERENCES Authors(ID_Author),



);









CREATE TABLE  Sections(
ID_Section int primary key identity(1,1),
Name_Section varchar(15),
ID_Categories int ,
FOREIGN KEY (ID_Categories) REFERENCES Categories(ID_Categories ),



);

CREATE TABLE  Employees  (
ID_Employees   int primary key identity(1,1),
Name_Employees   varchar(15)


);






CREATE TABLE  Users   (
ID_Users    int primary key identity(1,1),
Name_Users    varchar(15)


);


CREATE TABLE  Users_Books   (
ID_Users int,
ID_Book int,
primary key(ID_Users,ID_Book),
FOREIGN KEY (ID_Users) REFERENCES Users(ID_Users ),
FOREIGN KEY (ID_Book) REFERENCES Books(ID_Book ),




);


CREATE TABLE  Users_Employees   (
ID_Users int,
ID_Employees int,

primary key (ID_Users,ID_Employees),
FOREIGN KEY (ID_Users) REFERENCES Users(ID_Users ),
FOREIGN KEY (ID_Employees) REFERENCES Employees(ID_Employees )


);


INSERT INTO Authors (Name_Authors) VALUES
('Author1'),
('Author2'),
('Author3'),
('Author4'),
('Author5');
GO


INSERT INTO Categories (Name_Categories) VALUES
('Fiction'),
('Non-Fiction'),
('Science Fiction'),
('Movies'),
('Serires');
GO

-- Reset identity seed for Books table to ensure it starts at 1
DBCC CHECKIDENT ('Books', RESEED, 0);
GO


INSERT INTO Books (Name_Book, ID_Author, ID_Categories) VALUES
('Book1', 1, 1),
('Book2', 1, 2),
('Book3', 2, 3),
('Book4', 2, 1),
('Book5', 3, 2);
GO


INSERT INTO Users (Name_Users) VALUES
('User1'),
('User2'),
('User3'),
('User4'),
('User5');
GO


INSERT INTO Users_Books (ID_Users, ID_Book) VALUES
(1, 1), -- User 1 has Book 1
(1, 2), -- User 1 has Book 2
(2, 3), -- User 2 has Book 3
(2, 4), -- User 2 has Book 4
(3, 5), -- User 3 has Book 5
(3, 1), -- User 3 has Book 1
(4, 2), -- User 4 has Book 2
(4, 3), -- User 4 has Book 3
(5, 4), -- User 5 has Book 4
(5, 5); -- User 5 has Book 5
GO


select Name_Authors,Name_Book
from Authors a INNER JOIN Books b
ON a.ID_Author=b.ID_Author


select Name_Authors,Name_Book
from Authors a LEFT JOIN  Books b
ON a.ID_Author=b.ID_Author


select Name_Authors,Name_Book
from Authors a RIGHT JOIN Books b
ON a.ID_Author=b.ID_Author


select Name_Authors,Name_Book
from Authors a FULL JOIN Books b
ON a.ID_Author=b.ID_Author





select Name_Book,Name_Users
from Books a
INNER JOIN Users_Books b
ON  a.ID_Book=b.ID_Book
INNER JOIN Users c
ON c.ID_Users=b.ID_Users



select Name_Book,Name_Users
from Books a
LEFT JOIN Users_Books b
ON  a.ID_Book=b.ID_Book
INNER JOIN Users c
ON c.ID_Users=b.ID_Users



select Name_Book,Name_Users
from Books a
INNER JOIN Users_Books b
ON  a.ID_Book=b.ID_Book
RIGHT JOIN Users c
ON c.ID_Users=b.ID_Users


select Name_Book,Name_Users
from Books a
INNER JOIN Users_Books b
ON  a.ID_Book=b.ID_Book
INNER JOIN Users c
ON c.ID_Users=b.ID_Users


