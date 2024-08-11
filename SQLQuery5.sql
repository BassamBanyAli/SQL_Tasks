create database SchoolManagementSystem ;





create table family_info(
ID int IDENTITY(1,1) primary key,
father NVARCHAR(50) unique,
phone NVARCHAR(50),



);



create table students (
ID INT IDENTITY(1,1) PRIMARY KEY,
name NVARCHAR(50) ,
dateOfBirth date,
Address NVARCHAR(50),
father NVARCHAR(50),
foreign key (father) references family_info(father)

);



CREATE TABLE Courses (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseName VARCHAR(255),
    Description TEXT,
    Resource VARCHAR(255),
);
create table students_courses(
ID int ,
CourseID int,
EnrollmentDate DATE,
    PRIMARY KEY (ID, CourseID),
foreign key (ID) references students(ID),
foreign key (CourseID) references Courses(CourseID),





);

CREATE TABLE Classes (
    ClassID INT IDENTITY(1,1) PRIMARY KEY,
    ClassCode VARCHAR(50) NOT NULL,
    RoomNumber VARCHAR(20),
    Schedule VARCHAR(100),
	CourseID int,
	foreign key (CourseID) references Courses(CourseID),


);


CREATE TABLE Assignments (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    DueDate DATE,
	CourseID int,
	StudentID int,
	foreign key (CourseID) references Courses(CourseID),
	foreign key (StudentID) references Students(ID),


);


CREATE TABLE Attendance (
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    ClassID INT NOT NULL,
    AttendanceDate DATE NOT NULL,
    AbsenceType VARCHAR(10) CHECK (AbsenceType IN ('Leaving', 'Absence', 'Late')),
    Reason VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(ID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);


INSERT INTO family_info (father, phone) VALUES
('bassam', '079834343243'),
('ahmad', '1234567891'),
('mariem', '1234567892'),
('sobhi', '1234567893'),
('yamen', '1234567894'),
('beso', '1234567895');



INSERT INTO students (name, dateOfBirth, Address, father) VALUES
('bassam1', '2005-03-15', 'irbid alasreeh', 'bassam'),
('ahmad1', '2004-07-22', 'irbid', 'ahmad'),
('ahmad2', '2006-11-05', 'irbid', 'ahmad'),
('sobhi1', '2005-01-17', 'irbid', 'yamen'),
('mariem1', '2004-09-23', 'irbid', 'beso');


INSERT INTO Courses (CourseName, Description, Resource) VALUES
('Mathematics 101', 'Introduction to basic mathematics.', 'Textbook A'),
('Science 101', 'Basics of general science.', 'Textbook B'),
('History 101', 'Overview of world history.', 'Textbook C'),
('English 101', 'Basic English grammar and literature.', 'Textbook D'),
('Biology 101', 'Introduction to biology.', 'Textbook E');



INSERT INTO students_courses (ID, CourseID, EnrollmentDate) VALUES
(1, 1, '2024-01-10'),
(1, 2, '2024-01-10'),
(2, 1, '2024-01-11'),
(2, 3, '2024-01-11'),
(3, 4, '2024-01-12'),
(3, 5, '2024-01-12'),
(4, 1, '2024-01-13'),
(4, 2, '2024-01-13'),
(5, 2, '2024-01-14'),
(5, 3, '2024-01-14');


INSERT INTO Classes (ClassCode, RoomNumber, Schedule, CourseID) VALUES
('MATH101', 'Room 101', 'Mon, Wed 9:00AM - 10:30AM', 1),
('SCI101', 'Room 102', 'Tue, Thu 10:30AM - 12:00PM', 2),
('HIST101', 'Room 103', 'Mon, Wed 1:00PM - 2:30PM', 3),
('ENG101', 'Room 104', 'Tue, Thu 2:30PM - 4:00PM', 4),
('BIO101', 'Room 105', 'Mon, Wed 3:00PM - 4:30PM', 5);



INSERT INTO Assignments (Name, Description, DueDate, CourseID, StudentID) VALUES
('Homework 1', 'Complete exercises 1-10.', '2024-02-01', 1, 1),
('homework2', 'Submit lab report on experiment.', '2024-02-05', 2, 2),
('homework3', 'Write an essay on early civilizations.', '2024-02-10', 3, 3),
('homework4', 'Take a test on grammar.', '2024-02-15', 4, 4),
('homework5', 'Prepare a presentation on cell biology.', '2024-02-20', 5, 5);


INSERT INTO Attendance (StudentID, ClassID, AttendanceDate, AbsenceType, Reason) VALUES
(1, 1, '2024-01-10', 'Late', 'Traffic'),
(1, 2, '2024-01-11', 'Absence', 'Sick'),
(2, 1, '2024-01-12', 'Leaving', 'Doctor Appointment'),
(2, 3, '2024-01-13', 'Late', 'Car Trouble'),
(3, 4, '2024-01-14', 'Absence', 'Family Event'),
(3, 4, '2024-01-15', 'Absence', 'Family Event'),
(3, 4, '2024-01-16', 'Absence', 'Family Event'),
(3, 4, '2024-01-17', 'Absence', 'Family Event');


--1- Select students in a specific Date date ?
select * 
from Students 
where  dateOfBirth='2005-03-15';


--2- Select details of a course by its name ? 

select *
from Courses 
where CourseName='Mathematics 101';


--3-Add a new column 'Email' to the Students table ?
alter table Students
add Email NVARCHAR(50);


--4- Insert a new student record ?


INSERT INTO Students (name, dateOfBirth, Address, father,Email)
VALUES ('bbb', '2000-03-23', 'irbid','sobhi', 'bassambanyai@gmail.com');


--5- Select students who have relatives listed in the system ? 

SELECT s.name AS StudentWithSameFather
FROM Students s
WHERE EXISTS (
    SELECT 1
    FROM Students other
    WHERE s.father = other.father
      AND s.ID <> other.ID
);


SELECT  DISTINCT s.name AS StudentWithSameFather
FROM Students s
INNER JOIN Students a
on s.father=a.father
AND s.ID <> a.ID;



--6- Select students who are enrolled in a specific course (e.g : Math) ? 

SELECT name
FROM Students s
INNER JOIN students_courses a ON s.ID = a.ID
INNER JOIN Courses c ON a.CourseID = c.CourseID
where CourseName='Mathematics 101';


--7- Select students who have submitted and passed a specific assignment (e.g : sql  Assignment ) ? 

select s.name 
from Students s INNER JOIN Assignments a
on s.ID=a.StudentID
where a.name='Homework 1';


--8- i need the student who tooke an leaving between last sunday and the Thursday ? (e.g: between this date : 1/1/2024 - 5/1/2024 )


select s.name
from Students s INNER JOIN 
Attendance a 
on s.ID=a.StudentID
where a.AbsenceType='Leaving'AND a.AttendanceDate between '1/1/2024'AND '5/1/2024';



--9- i need the names of students who have absence mre than 4 ? ( not late of leaving )


select s.name 
from students s
INNER JOIN Attendance a
on s.ID=a.StudentID
where AbsenceType='absence'
GROUP BY s.name
HAVING COUNT(a.AbsenceType) >= 4;
