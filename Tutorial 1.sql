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
