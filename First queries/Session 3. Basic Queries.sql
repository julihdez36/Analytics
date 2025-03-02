SELECT * FROM student;

-- select query
SELECT student.name, student.major -- call the table is optional
from student; 

-- Order by query
SELECT student.name, student.major 
FROM student
ORDER BY name DESC;

SELECT *FROM student
ORDER BY major, student_id DESC;


-- getting 2 back

SELECT * FROM student 
ORDER By student_id DESC
LIMIT 2;

-- getting records by conditons

SELECT * FROM student 
where major = 'Chemistry';

SELECT * FROM student 
where major = 'Chemistry' OR major = 'Biology';

-- Let's play with different statements

SELECT * FROM student 
WHERE student_id <= 3 AND name <> 'Jack'; --not equal to



