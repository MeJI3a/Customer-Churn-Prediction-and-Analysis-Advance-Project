CREATE DATABASE CustomerData;
USE CustomerData;

CREATE TABLE StagingTable (
    CustomerID VARCHAR(10),
    Age INT,
    Gender VARCHAR(10),
    Tenure INT,
    UsageFrequency INT,
    SupportCalls INT,
    PaymentDelay INT,
    SubscriptionType VARCHAR(50),
    ContractLength VARCHAR(50),
    TotalSpend DECIMAL(10, 2),
    LastInteraction INT,
    Churn BOOLEAN
);

ALTER TABLE StagingTable 
MODIFY Age VARCHAR(255),
MODIFY Tenure VARCHAR(255),
MODIFY UsageFrequency VARCHAR(255),
MODIFY SupportCalls VARCHAR(255),
MODIFY PaymentDelay VARCHAR(255),
MODIFY LastInteraction VARCHAR(255),
MODIFY Churn VARCHAR(255);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_churn_dataset.csv'
INTO TABLE StagingTable
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(CustomerID, Age, Gender, Tenure, UsageFrequency, SupportCalls, PaymentDelay, SubscriptionType, ContractLength, TotalSpend, LastInteraction, Churn)
SET 
    CustomerID = NULLIF(CustomerID, ''),
    Age = NULLIF(Age, ''),
    Gender = NULLIF(Gender, ''),
    Tenure = NULLIF(Tenure, ''),
    UsageFrequency = NULLIF(UsageFrequency, ''),
    SupportCalls = NULLIF(SupportCalls, ''),
    PaymentDelay = NULLIF(PaymentDelay, ''),
    SubscriptionType = NULLIF(SubscriptionType, ''),
    ContractLength = NULLIF(ContractLength, ''),
    TotalSpend = NULLIF(TotalSpend, ''),
    LastInteraction = NULLIF(LastInteraction, ''),
    Churn = NULLIF(Churn, '');


USE CustomerData;
SHOW TABLES;

SELECT * FROM stagingtable LIMIT 10;


-- 1. Customers table to store customer information
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Tenure INT
);

-- 2. UsageData table to store data on customer service usage
CREATE TABLE UsageData (
    UsageID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    UsageFrequency INT,
    SupportCalls INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 3. Financials table to store financial details
CREATE TABLE Financials (
    FinancialID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    PaymentDelay INT,
    TotalSpend DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. Subscriptions table to store subscription details
CREATE TABLE Subscriptions (
    SubscriptionID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    SubscriptionType VARCHAR(50),
    ContractLength VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 5. ChurnData table to store customer churn information
CREATE TABLE ChurnData (
    ChurnID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Churn BOOLEAN,
    LastInteraction INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

SELECT * FROM stagingtable WHERE CustomerID IS NULL;
DELETE FROM stagingtable WHERE CustomerID IS NULL;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM stagingtable WHERE CustomerID IS NULL;
SET SQL_SAFE_UPDATES = 1;

-- Transfer Data from stagingtable to Normalized Tables
INSERT INTO Customers (CustomerID, Age, Gender, Tenure)
SELECT CustomerID, Age, Gender, Tenure
FROM stagingtable;

INSERT INTO UsageData (CustomerID, UsageFrequency, SupportCalls)
SELECT CustomerID, UsageFrequency, SupportCalls
FROM stagingtable;

INSERT INTO Financials (CustomerID, PaymentDelay, TotalSpend)
SELECT CustomerID, PaymentDelay, TotalSpend
FROM stagingtable;

INSERT INTO Subscriptions (CustomerID, SubscriptionType, ContractLength)
SELECT CustomerID, SubscriptionType, ContractLength
FROM stagingtable;

INSERT INTO ChurnData (CustomerID, Churn, LastInteraction)
SELECT CustomerID, Churn, LastInteraction
FROM stagingtable;

-- Drop Temporary Table
DROP TABLE stagingtable;


-- Check Data in Normalised Tables
SELECT * FROM Customers LIMIT 10;

SELECT * FROM UsageData LIMIT 10;

SELECT * FROM Financials LIMIT 10; 

SELECT * FROM Subscriptions LIMIT 10; 

SELECT * FROM ChurnData LIMIT 10;

SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM UsageData;
SELECT COUNT(*) FROM Financials;
SELECT COUNT(*) FROM Subscriptions;
SELECT COUNT(*) FROM ChurnData;







