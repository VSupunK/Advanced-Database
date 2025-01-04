-- Construct a view that shows all provinces to which the bills are being sent.Also
-- display the total amount of money and the total number of bills being sent to each
-- Province.


CREATE TABLE COMPANY (
    Name VARCHAR(50),
    Province VARCHAR(50)
);

INSERT INTO COMPANY (Name, Province)
VALUES
    ('ABC', 'Western'),
    ('DEF', 'Northern'),
    ('GHI', 'Western'),
    ('JKL', 'Southern');

CREATE TABLE SENT_BILLS (
    Name VARCHAR(50),
    Amount DOUBLE
);

INSERT INTO SENT_BILLS (Name, Amount)
VALUES
    ('ABC', 5000),
    ('DEF', 3000),
    ('GHI', 4500),
    ('JKL', 2000),
    ('ABC', 6000),
    ('DEF', 2500);

-----------------------

CREATE VIEW EXAMPLE (Province, TOTAL_BILLS, TOTAL_AMOUNT) AS 
SELECT 
    COMPANY.Province, 
    COUNT(BILLS.Name) AS TOTAL_BILLS, 
    SUM(BILLS.Amount) AS TOTAL_AMOUNT 
FROM 
    BILLS
INNER JOIN 
    COMPANY 
ON 
    BILLS.Name = COMPANY.Name
GROUP BY 
    COMPANY.Province;

