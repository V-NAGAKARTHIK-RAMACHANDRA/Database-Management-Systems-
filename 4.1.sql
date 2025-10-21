create database university; 
 
use university; 
 
CREATE TABLE univ_denorm ( 
  StudentID INTEGER, StudentName TEXT, Major TEXT, 
  CourseID TEXT, CourseName TEXT, Credits INTEGER, 
  EnrollmentDate TEXT, 
  InstructorID INTEGER, InstructorName TEXT, Phone TEXT 
); 
 
Query to insert data values into univ_denorm table. 
 
INSERT INTO univ_denorm 
(StudentID, StudentName, Major, CourseID, CourseName, Credits, EnrollmentDate, InstructorID, 
InstructorName, Phone) 
VALUES 
(1, 'Alice Smith', 'Computer Science', 'C101', 'Intro to CS', 3, '2025-09-01', 10, 'Dr. Adams', '555
0100'), 
(1, 'Alice Smith', 'Computer Science', 'C101', 'Intro to CS', 3, '2025-09-01', 11, 'Dr. Baker', '555
0111'), 
(2, 'Bob Jones', 'Mathematics', 'C101', 'Intro to CS', 3, '2025-09-03', 10, 'Dr. Adams', '555-0100'), 
(2, 'Bob Jones', 'Mathematics', 'C101', 'Intro to CS', 3, '2025-09-03', 11, 'Dr. Baker', '555-0111'), 
(1, 'Alice Smith', 'Computer Science', 'C102', 'Calculus I', 4, '2025-09-02', 11, 'Dr. Baker', '555
0111'), 
(3, 'Carol Lee', 'Physics', 'C103', 'Physics I', 4, '2025-09-04', 12, 'Dr. Clark', '555-0122'); 
 
 
Query to view data in the table: 
 
Select * from univ_denorm; 
Date: Roll No. 
29 Database Management Systems Lab 
Functional Dependencies: 
• StudentID → StudentName, Major 
• CourseID → CourseName, Credits 
• InstructorID → InstructorName, Phone 
• (StudentID, CourseID) → EnrollmentDate 
 
Candiadate key identified is: 
 
(StudentID, CourseID, InstructorID) → All other attributes 
 
Normalization to Second Normal Form (2NF) 
 
Students Table: 
 
Date: Roll No. 
30 Database Management Systems Lab 

Queries to generate normalized tables: 
 
CREATE TABLE Students AS 
  SELECT DISTINCT StudentID, StudentName, Major FROM univ_denorm; 
 
CREATE TABLE Courses AS 
  SELECT DISTINCT CourseID, CourseName, Credits FROM univ_denorm; 
 
CREATE TABLE Instructors AS 
  SELECT DISTINCT InstructorID, InstructorName, Phone FROM univ_denorm; 
 
CREATE TABLE Enrollments AS 
  SELECT DISTINCT StudentID, CourseID, EnrollmentDate FROM univ_denorm; 
 
CREATE TABLE Course_Instructors AS 
  SELECT DISTINCT StudentID,CourseID, InstructorID FROM univ_denorm; 
 
 
After splitting into new tables and verifying the normalised tables are in 3NF, BCNF, 4NF. 
 
In order to verify 5NF performing JOIN dependency. 
 
SELECT e.StudentID, s.StudentName, s.Major, 
       e.CourseID, c.CourseName, c.Credits, e.EnrollmentDate, 
       ci.InstructorID, i.InstructorName, i.Phone 
FROM Enrollments e 
JOIN Students s ON e.StudentID = s.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID 
JOIN Course_Instructors ci ON c.CourseID = ci.CourseID 
JOIN Instructors i ON ci.InstructorID = i.InstructorID 
ORDER BY e.StudentID, e.CourseID, ci.InstructorID; 