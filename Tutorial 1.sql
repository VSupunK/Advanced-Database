CREATE TABLE techpro (
    Product VARCHAR(20),
    Unit_Price DOUBLE
);

INSERT INTO techpro (Product, Unit_Price) VALUES
    ('TechBook', 60.00),
('TechPen', 90.00),
('TechBag', 450.00),
('ProPen', 150.00),
('ProNotebook', 120.00),
('ProMarker', 80.00);

CREATE TEMPORARY TABLE temp_techpro AS
SELECT DISTINCT Product AS ProductName, Unit_Price 
FROM techpro
WHERE Unit_Price < (SELECT avg(Unit_Price) FROM
techpro); 

SELECT * FROM temp_techpro;

-----------

SELECT AVG(Unit_Price) AS AverageUnitPrice
FROM techpro;

-----------
INSERT INTO temp_techpro (ProductName, Unit_Price)
SELECT DISTINCT Product AS ProductName, Unit_Price 
FROM techpro
WHERE Unit_Price < (SELECT AVG(Unit_Price) FROM techpro);

--
SELECT insert_student('S105', 85, 90, 88);
--------------------

CREATE TEMPORARY TABLE TOTAL_S AS
SELECT Student_ID, (Math + Science + English) AS Total_Marks
FROM Student_Marks;

--------------------

CREATE TEMPORARY TABLE Below_Avg_Students AS
SELECT Student_ID
FROM TOTAL_S
WHERE Total_Marks < (SELECT AVG(Total_Marks) FROM TOTAL_S);

SELECT * FROM Below_Avg_Students;



DELIMITER //

CREATE PROCEDURE SumPrimes()
BEGIN
    DECLARE i INT DEFAULT 2;
    DECLARE sum INT DEFAULT 0;

    WHILE i <= 100 DO
        -- Check if the number is prime using the condition
        IF i = 2 OR i = 3 OR i = 5 OR i = 7 OR (i MOD 2 != 0 AND i MOD 3 != 0 AND i MOD 5 != 0 AND i MOD 7 != 0) THEN
            SET sum = sum + i;
        END IF;

        SET i = i + 1;
    END WHILE;

    -- Output the result
    SELECT sum AS PrimeSum;
END //

DELIMITER ;


CALL SumPrimes;