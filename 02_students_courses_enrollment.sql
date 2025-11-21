-- Question 2: Students and Courses Enrollment
-- Write an SQL query to display the list of students along with the course names 
-- they are enrolled in. Ensure the output shows student names and course names 
-- using appropriate joins.

-- Tables:
-- students(studentid, name)
-- courses(courseid, coursename)
-- enrollments(studentid, courseid)

-- Solution:
SELECT 
    s.name AS student_name,
    c.coursename AS course_name
FROM 
    students s
INNER JOIN 
    enrollments e ON s.studentid = e.studentid
INNER JOIN 
    courses c ON e.courseid = c.courseid
ORDER BY 
    s.name, c.coursename;
