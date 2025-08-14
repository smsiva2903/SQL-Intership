Attendance Management System – MySQL Project
 Overview

The Attendance Management System is a MySQL-based project designed to track students, faculty, courses, and their attendance records.

This project uses SQL Views to simplify data reporting and analysis.

##  Database Structure

1. Student Table

Stores information about students.

Column	      Type      	 Description

student_id	  INT (PK)	     Unique ID for each student
name	      VARCHAR(100)	 Student's name
email	      VARCHAR(100)	 Student's email
department	  VARCHAR(50) 	 Department name

2. Faculty Table

Stores information about faculty members.

Column	      Type	         Description

faculty_id	  INT (PK)	     Unique ID for each faculty
name	      VARCHAR(100)	 Faculty's name
email	      VARCHAR(100)	 Faculty's email
department	  VARCHAR(50)	 Department name

3. Course Table

Stores information about courses offered.

Column	       Type	         Description

course_id	   INT (PK)	     Unique ID for each course
course_name    VARCHAR(100)	 Name of the course
faculty_id	   INT (FK)	     Links to Faculty(faculty_id)

4. Attendance Table

Stores daily attendance records for students.

Column	        Type	    Description

attendance_id	INT (PK)	Unique ID for each attendance record
student_id	    INT (FK)	Links to Student(student_id)
course_id	    INT (FK)	Links to Course(course_id)
date	        DATE	    Date of the attendance
status	        ENUM	    Present / Absent

##  Views in the Project

1. FacultyCourse

Displays each faculty member with their assigned courses.

CREATE VIEW FacultyCourse AS
SELECT f.name AS faculty_name, f.department, c.course_name
FROM Faculty f
JOIN Course c ON f.faculty_id = c.faculty_id;

2. DailyAttendanceSummary

Summarizes the total number of students present and absent per day.

CREATE VIEW DailyAttendanceSummary AS
SELECT date,
       SUM(status = 'Present') AS total_present,
       SUM(status = 'Absent') AS total_absent
FROM Attendance
GROUP BY date;

3. PythonFullAttendees

Lists students who attended all Python classes.

CREATE VIEW PythonFullAttendees AS
SELECT s.student_id, s.name
FROM Student s
JOIN Attendance a ON s.student_id = a.student_id
JOIN Course c ON a.course_id = c.course_id
WHERE c.course_name = 'python'
GROUP BY s.student_id, s.name
HAVING SUM(status = 'Present') = COUNT(*);

4. CourseAvgAttendance

Shows the average attendance percentage for each course.

CREATE VIEW CourseAvgAttendance AS
SELECT c.course_name,
       ROUND(AVG(a.status = 'Present') * 100, 2) AS avg_attendance_percent
FROM Attendance a
JOIN Course c ON a.course_id = c.course_id
GROUP BY c.course_name;

##  How to Run the Project

Open MySQL Workbench or any SQL client.

Run the script to:

Create the database and tables.

Insert sample data.

Create views for analysis.

Query the views:

SELECT * FROM FacultyCourse;

SELECT * FROM DailyAttendanceSummary;

SELECT * FROM PythonFullAttendees;

SELECT * FROM CourseAvgAttendance
