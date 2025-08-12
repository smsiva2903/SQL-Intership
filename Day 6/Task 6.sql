CREATE DATABASE IF NOT EXISTS AttendanceDB;
USE AttendanceDB;
DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Student;
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Student (name, email, department) VALUES
('janani', 'janani@example.com', 'CSE'),
('sanjee', 'sanjee@example.com', 'ECE'),
('ramya', 'ramya@example.com', 'IT'),
('mathi', 'mathi@example.com', 'CSE');
CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO Faculty (name, email, department) VALUES
('surya', 'surya@example.com', 'CSE'),
('hari', 'hari@example.com', 'ECE'),
('prabhu', 'prabhu@example.com', 'EEE');
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);
INSERT INTO Course (course_name, faculty_id) VALUES
('python', 1),
('Electronics', 2),
('software engineering', 3);
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent'),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
INSERT INTO Attendance (student_id, course_id, date, status) VALUES
(1, 1, '2025-08-01', 'Present'),
(2, 2, '2025-08-01', 'Absent'),
(3, 1, '2025-08-01', 'Present'),
(4, 1, '2025-08-01', 'Absent'),

(1, 1, '2025-08-02', 'Present'),
(2, 2, '2025-08-02', 'Present'),
(3, 1, '2025-08-02', 'Absent'),
(4, 1, '2025-08-02', 'Present');
SELECT name FROM Student
WHERE student_id = (
    SELECT student_id
    FROM Attendance
    WHERE status = 'Present'
    GROUP BY student_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
SELECT name FROM Student
WHERE student_id IN (
    SELECT student_id
    FROM Attendance
    WHERE course_id = (
        SELECT course_id FROM Course WHERE course_name = 'python'
    )
);
SELECT name FROM Student s
WHERE EXISTS (
    SELECT 1
    FROM Attendance a
    WHERE a.student_id = s.student_id
      AND a.status = 'Absent'
);
SELECT s.name,
       (SELECT COUNT(*)
        FROM Attendance a
        WHERE a.student_id = s.student_id
          AND a.status = 'Present') AS present_count
FROM Student s;
SELECT course_name, avg_present
FROM (
    SELECT c.course_name, AVG(a.status = 'Present') * 100 AS avg_present
    FROM Attendance a
    JOIN Course c ON a.course_id = c.course_id
    GROUP BY c.course_name
) AS course_avg
WHERE avg_present > 50;