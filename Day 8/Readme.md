## Attendance Management Database
## Overview

This project is a MySQL-based Attendance Management System that tracks students, faculty, courses, and attendance records.It also demonstrates Views for quick access to summarized and related data.

## Features

Store details of Students, 

Faculty, and 

Courses

Track daily Attendance (Present / Absent)

Create Views for:

Attendance details by student

Total present days per student

Attendance percentage

Faculty assigned to each student

Filter records easily using WHERE conditions in Views

Created Views

1️ View_AttendanceByStudent

Shows attendance records for each student along with course details.

CREATE OR REPLACE VIEW View_AttendanceByStudent AS
SELECT s.name AS student_name, c.course_name, a.date, a.status
FROM Student s
JOIN Attendance a ON s.student_id = a.student_id
JOIN Course c ON a.course_id = c.course_id;

2️ View_StudentPresentCount

Shows total present days for each student.

CREATE OR REPLACE VIEW View_StudentPresentCount AS
SELECT student_id, COUNT(*) AS total_present
FROM Attendance
WHERE status = 'Present'
GROUP BY student_id;

3️ View_AttendancePercentage

Shows attendance percentage for each student.

CREATE OR REPLACE VIEW View_AttendancePercentage AS
SELECT student_id,
       ROUND((SUM(status = 'Present') / COUNT(*)) * 100, 2) AS attendance_percentage
FROM Attendance
GROUP BY student_id;

4️ View_StudentFaculty

Shows which faculty is teaching a student.

CREATE OR REPLACE VIEW View_StudentFaculty AS
SELECT DISTINCT s.student_id, s.name AS student_name, f.name AS faculty_name
FROM Student s
JOIN Attendance a ON s.student_id = a.student_id
JOIN Course c ON a.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id;

## Select Query

Get Attendance of a Specific Student

SELECT * FROM View_AttendanceByStudent WHERE student_name = 'janani';


Get Present Count for Student ID 1

SELECT * FROM View_StudentPresentCount WHERE student_id = 1;


Get Attendance Percentage

SELECT * FROM View_AttendancePercentage;


Get Faculty Name for Student ID 1

SELECT * FROM View_StudentFaculty WHERE student_id = 1;