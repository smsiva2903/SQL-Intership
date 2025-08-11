#  Attendance Management System – SQL Joins

This project demonstrates **SQL Joins** using the Attendance Management System database created in MySQL.

---

##  Database Structure

### Tables Used:
1. **Student** – Stores student details.
2. **Faculty** – Stores faculty details.
3. **Course** – Stores course details with faculty reference.
4. **Attendance** – Stores attendance records linking students and courses.

---

##  SQL Joins Demonstrated

### **1. INNER JOIN**

```sql
SELECT s.name AS student_name, c.course_name, a.status
FROM Student s
INNER JOIN Attendance a ON s.student_id = a.student_id
INNER JOIN Course c ON a.course_id = c.course_id;

### **2.  OUTER JOIN**
SELECT s.name AS student_name, a.date, a.status
FROM Student s
LEFT JOIN Attendance a ON s.student_id = a.student_id;
 
 ### **3.  RIGHT JOIN
 SELECT c.course_name, s.name AS student_name, a.status
FROM Course c
RIGHT JOIN Attendance a ON c.course_id = a.course_id
RIGHT JOIN Student s ON a.student_id = s.student_id;

### **4.  FULL OUTER JOIN
SELECT s.name AS student_name, a.date, a.status
FROM Student s
LEFT JOIN Attendance a ON s.student_id = a.student_id
UNION
SELECT s.name AS student_name, a.date, a.status
FROM Student s
RIGHT JOIN Attendance a ON s.student_id = a.student_id;

