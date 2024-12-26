1. CREATE DATABASE adbms_practice;

2. USE adbms_practice;

3.
CREATE TABLE Salary(
	Account_ID INT AUTO_INCREMENT,
    Company VARCHAR(50),
    Account VARCHAR(50),
    Amount DOUBLE,
    PRIMARY KEY(Account_ID)
);

4.
INSERT INTO Salary(Company, Account, Amount) VALUES
    ('ABC', '111111', 450.00),
    ('XYZ', '222222', 15000.00),
    ('QRT', '333333', 10000.00),
    ('SSSS', '444444', 5000.00);

