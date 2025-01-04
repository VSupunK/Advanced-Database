-- Create a new database named 'Student_info'
CREATE DATABASE Student_info;

-- Switch to the newly created database
USE Student_info;

-- Create a table named 'Student' with columns for ID and Name
CREATE TABLE Student (
    Student_ID INT,       -- Unique identifier for each student
    Name VARCHAR(30)      -- Name of the student
);

-- Insert sample data into the 'Student' table
INSERT INTO Student (Student_ID, Name) 
VALUES
    (1, 'Rohan'),
    (2, 'Sahan'),
    (3, 'Prasanna'),
    (4, 'Suresh');

-- Display all data from the 'Student' table
SELECT * FROM Student;

-- Create a view named 'ViewStudent' that selects all data from the 'Student' table
CREATE VIEW ViewStudent AS 
SELECT * FROM Student;

-- Display all data from the 'ViewStudent' view
SELECT * FROM ViewStudent;

-- Retrieve all students with 'Student_ID' greater than 2
SELECT * 
FROM Student 
WHERE Student_ID > 2;
