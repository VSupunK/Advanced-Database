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

-- Using 'ViewStudent' view table
SELECT * FROM ViewStudent
WHERE Student_ID > 2;

-- Switch to the 'information_schema' database to access metadata about database objects
USE information_schema;

-- Query to list all views in the MySQL database
SELECT 
    table_schema,      -- Schema (database) where the view is located
    table_name         -- Name of the view
FROM 
    information_schema.tables
WHERE 
    table_type = 'VIEW';  -- Filters only objects that are views


-----------------------------------------------
-- Create a new database named 'personal_info'
CREATE DATABASE personal_info;

-- Switch to the newly created database
USE personal_info;

-- Create a table named 'personal_details' with relevant columns
CREATE TABLE personal_details (
    Customer_Name VARCHAR(45),        -- Customer's name
    Mailing_Address VARCHAR(200),     -- Customer's mailing address
    City VARCHAR(100),                -- City of the customer
    Province VARCHAR(150)             -- Province of the customer
);

-- Insert sample data into the 'personal_details' table
INSERT INTO personal_details (Customer_Name, Mailing_Address, City, Province)
VALUES
    ('Raj', '01, Main Street, Kotahena', 'Colombo', 'Western'),
    ('Varo', '05, 2nd Avenue Wellawatte', 'Colombo', 'Western'),
    ('Rohan', '432, Main Street, Kayts', 'Jaffna', 'Northern');

-- Create a view named 'full_home_address' with renamed columns and a concatenated address
CREATE VIEW full_home_address(Name, Home_Address) AS
SELECT 
    Customer_Name AS Name, 
    CONCAT(Mailing_Address, ", ", City, ", ", Province) AS Home_Address
FROM 
    personal_details;

-- Query the view to display renamed columns and full home address
SELECT * 
FROM full_home_address;


----- Creating Views by syncing multiple tables------


