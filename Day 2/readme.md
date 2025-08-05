#  Attendance Management System — Task 2

##  Internship Task Objective

This project is a continuation of the attendance management system from Task 1. In this task, we focused on **data insertion**, **updating**, **deletion**, and **handling NULL values** using SQL.

---

##  Database Schema (DDL Summary)

- **Stud**: Stores student details.
- **Faclty**: Stores faculty information.
- **Coures**: Stores course details (linked to faculty).
- **studentAttendance**: Tracks attendance records per student per course.

>  Note: Table names are intentionally spelled as used in the original SQL (`Stud`, `Faclty`, `Coures`) for consistency.

---

##  Key SQL Operations Used (DML)

###  1. Insert Data
```sql
INSERT INTO Stud (name, email, department) VALUES
('sai', 'sai@example.com', 'CSE'),
('dhinesh', 'dhinesh@example.com', 'ECE'),
('meena', 'meena@example.com', 'IT'),
('gayu', 'gayu@example.com', 'CSE');
UPDATE Faclty
SET email = 'devi_new@example.com'
WHERE faculty_id = 2;

UPDATE Stud
SET department = 'AIML'
WHERE student_id = 3;

DELETE FROM Stud
WHERE student_id = 4;

DELETE FROM studentAttendance
WHERE attendance_id = 2;

DELETE FROM Coures
WHERE course_id = 2;
