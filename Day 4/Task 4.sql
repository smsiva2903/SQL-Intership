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
SELECT COUNT(*) AS total_attendance_records FROM Attendance;
SELECT SUM(status = 'Present') AS total_present_days FROM Attendance;
SELECT AVG(student_id) AS average_student_id FROM Attendance;
SELECT student_id, COUNT(*) AS total_classes FROM Attendance GROUP BY student_id;
SELECT student_id, SUM(status = 'Present') AS total_present FROM Attendance GROUP BY student_id;
SELECT student_id, AVG(status = 'Present') * 100 AS avg_attendance_percent FROM Attendance GROUP BY student_id;
SELECT student_id, SUM(status = 'Present') AS total_present FROM Attendance
GROUP BY student_id HAVING total_present > 1;
SELECT student_id, AVG(status = 'Present') * 100 AS avg_attendance FROM Attendance
GROUP BY student_id HAVING avg_attendance < 75;
SELECT date, COUNT(*) AS present_count FROM Attendance WHERE status = 'Present'
GROUP BY date HAVING present_count > 2;








