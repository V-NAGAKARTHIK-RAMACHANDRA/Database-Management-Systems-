-- Question 10: Set Join - Students with Enrollment or Marks
-- Write an SQL query to list all students who are either enrolled in at least one 
-- course or have scored marks in the marks table. Ensure there are no duplicate 
-- names in the output. Use UNION to combine the results.

-- Tables:
-- students(studentid, name)
-- enrollments(studentid, course)
-- marks(studentid, score)

-- Solution:
SELECT 
    s.name
FROM 
    students s
INNER JOIN 
    enrollments e ON s.studentid = e.studentid
UNION
SELECT 
    s.name
FROM 
    students s
INNER JOIN 
    marks m ON s.studentid = m.studentid
ORDER BY 
    name;

-- Alternative: Using DISTINCT with OR condition
-- SELECT DISTINCT s.name
-- FROM students s
-- LEFT JOIN enrollments e ON s.studentid = e.studentid
-- LEFT JOIN marks m ON s.studentid = m.studentid
-- WHERE e.studentid IS NOT NULL OR m.studentid IS NOT NULL
-- ORDER BY s.name;

-- Note: UNION automatically removes duplicates
-- If you want to keep duplicates, use UNION ALL
