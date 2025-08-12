###  Attendance Management System — Task 6 (Subqueries & Nested Queries)
## Overview
This project uses MySQL to demonstrate subqueries and nested queries in an Attendance Management System.

The database includes the following tables:

Student – Student details

Faculty – Faculty details

Course – Courses with faculty reference

Attendance – Attendance records linked to students & courses

## Database Schema
Primary Keys (PK): 

student_id, faculty_id, course_id, attendance_id

Foreign Keys (FK):

faculty_id in Course references Faculty(faculty_id)

student_id in Attendance references Student(student_id)

course_id in Attendance references Course(course_id)

## Subquery Examples
1. Scalar Subquery
Find the student with the highest number of Present days:

SELECT name
FROM Student
WHERE student_id = (
    SELECT student_id
    FROM Attendance
    WHERE status = 'Present'
    GROUP BY student_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

2. Subquery with IN
List students who attended the Python course:

SELECT name
FROM Student
WHERE student_id IN (
    SELECT student_id
    FROM Attendance
    WHERE course_id = (
        SELECT course_id FROM Course WHERE course_name = 'python'
    )
);

3. EXISTS Subquery
Find students who have at least one Absent record:

SELECT name
FROM Student s
WHERE EXISTS (
    SELECT 1
    FROM Attendance a
    WHERE a.student_id = s.student_id
      AND a.status = 'Absent'
);

4.  Subquery in FROM (Derived Table)
Find average attendance percentage per course:

SELECT course_name, avg_present
FROM (
    SELECT c.course_name, AVG(a.status = 'Present') * 100 AS avg_present
    FROM Attendance a
    JOIN Course c ON a.course_id = c.course_id
    GROUP BY c.course_name
) AS course_avg
WHERE avg_present > 50;

How to Run:

Create the AttendanceDB database and tables.

Insert sample data as provided in attendance.sql.

Run the above queries in MySQL Workbench or any MySQL client.
