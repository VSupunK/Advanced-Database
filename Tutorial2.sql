----Q1

-- i) Write the SQL queries to construct the following table and insert data into the table

CREATE TABLE Student_marks (
    Student_ID VARCHAR(5) PRIMARY KEY,
    Math INT,
    Science INT,
    English INT
);

INSERT INTO Student_marks VALUES 
    ('S102', 78, 81, 81),
    ('S103', 91, 69, 84),
    ('S104', 84, 83, 67);

---- ii) Write a MySQL stored function that prompts the user to input the Student_ID. The function should output the average mark of the given student.

DELIMITER | 
CREATE FUNCTION avg_marks(Stu_ID VARCHAR(5))
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE m1 INT, m2 INT, m3 INT, avg DOUBLE;
    SELECT Math, Science, English INTO m1, m2, m3 FROM Student_marks WHERE Student_ID=Stu_ID;
    SET avg = (m1+m2+m3)/3;
    RETURN avg;
END |

DELIMITER ;

SELECT avg_marks('S102');


--------------

DELIMITER |

CREATE FUNCTION avg_marks(Stu_ID VARCHAR(5))
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE m1 INT;
    DECLARE m2 INT;
    DECLARE m3 INT;
    DECLARE avg DOUBLE;
    
    SELECT Math, Science, English INTO m1, m2, m3 FROM Student_Marks WHERE Student_ID = Stu_ID;
    SET avg = (m1 + m2 + m3) / 3;
    RETURN avg;
END |

DELIMITER ;

>> SELECT avg_marks('S102');
-------------------------

DELIMITER |

CREATE FUNCTION insert_student(StudentID varchar(5), MathMarks(5), ScienceMark INT, EnglishMarks INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    INSERT INTO Student_Marks (Student_ID, Math, Science, English)
    VALUES (StudentID, MathMarks, ScienceMarks, EnglishMarks);

    RETURN CONCAT('Student', StudentID, 'insert successfullty.');
END |

DELIMITER ;