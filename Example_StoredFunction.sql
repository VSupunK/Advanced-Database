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
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CONCAT(first_name," ", last_name);
END |

DELIMITER;

----
SELECT full_name("Hello", "World") AS full_name;

---------------------------------------------

-- Exercise 02

Utilize the database “stored_function_class ”

Create a MySQL stored function that prompts the user to input a string.

The function should output the total number of characters in the string .

String : “ Sabaragamuwa” – input
Number of characters : 12 -- Output
----------------------------

DELIMITER |
CREATE FUNCTION word_length(Word varchar(50))
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN length(Word);
END |

DELIMITER;

----
SELECT word_length("Hello mysql"); 
-- OR we can write 
SELECT word_length("Hello mysql") AS Num_of_characters;

--Exercise 3

CREATE TABLE user_details(User_ID VARCHAR(10), Height DOUBLE, Weight_KG DOUBLE);

INSERT INTO user_details VALUES
('Usr_01', 1.5, 65.5),
('Usr_02', 1.7, 72),
('Usr_03', 1.0, 50.8),
('Usr_04', 1.85, 61),
('Usr_05', 1.53, 67);

Write a MySQL stored function that prompts 
      the user to input the id.

The function should output the BMI value of 
      the given user.

BMI value will be calculated based on the following equation.


--answer--

DELIMITER |
CREATE FUNCTION Calculate_BMI_Value (ID VARCHAR(10))
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE h,w,BMI_Value DOUBLE;
    SELECT Height, Weight_KG into h,w FROM user_details WHERE User_ID=ID;
    SET BMI_Value = (w/(h*h));
    RETURN BMI_Value;

END |

DELIMITER ;

--

SELECT Calculate_BMI_Value("Usr_04") AS BMI_Value;