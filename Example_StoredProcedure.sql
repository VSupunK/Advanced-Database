-- Exercise 1

CREATE DATABASE Stored_Procedure_Class;

USE Stored_Procedure_Class;

-----
CREATE TABLE Employee(
    ID VARCHAR(10),
    Name VARCHAR(10),
    Age INT
);

INSERT INTO Employee VALUES
    ("Emp_01", "Samal", 30),
    ("Emp_02", "Nimal", 40),
    ("Emp_03", "Roy", 80),
    ("Emp_04", "Jonny", 20);

-----

Create a MySQL stored procedure to get the first record  from the aforementioned table

----
DELIMITER |
CREATE PROCEDURE Exercise()
BEGIN
SELECT ID, Name, Age FROM Employee LIMIT 1;
END |

DELIMITER ;
-----
call Exercise();