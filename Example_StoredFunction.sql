-- Exercise-1
Create a database “stored_function_class ”

Create a MySQL stored function that prompts the user to input  his/her first name and last name.

The function should output the full name of the user.

First Name : Hello
Last Name :  World

Full Name  : Hello World -- Output
---------------------------------------

create database stored_function_class;

USE stored_function_class;

DELIMITER |
CREATE FUNCTION full_name(first_name varchar(10), last_name varchar(10))
RETURN VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CONCAT(first_name," ", last_name);
END |

DELIMITER;