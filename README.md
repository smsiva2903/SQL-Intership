Attendance Management System
Project Overview
This project is a simple *Attendance Management System* built using *MySQL*. It includes a basic schema with 4 main tables:
  Student
  Faculty
  Course
  Attendance

The system tracks which students attend which classes on which dates, and who teaches each course.

---

## Database Schema

### Tables and Relationships:

- *Student*: Stores student information.
- *Faculty*: Stores faculty information.
- *Course*: Each course is linked to a faculty member.
- *Attendance*: Records daily attendance of each student for a course.

---

##  SQL Features Used

- Primary and Foreign Keys
- AUTO_INCREMENT
- ENUM (for attendance status)
- Basic SELECT queries with JOINs
- Normalized structure (3NF)

---

## 📋 Sample SQL Queries

###  SELECT * FROM Student;

SELECT * FROM Attendance;

SELECT date, status 
FROM Attendance 
WHERE student_id = 1;

SELECT COUNT(*) FROM Student;

```sql

## ER Diagram
<img width="1536" height="1024" alt="ER Diagram" src="https://github.com/user-attachments/assets/85ae4c3d-2ab0-43a5-9951-a8522dc9214a" />

