USE CustomerData;

-- 1. Count the number of customers who churned vs. those who stayed
SELECT Churn, COUNT(*) AS Total
FROM ChurnData
GROUP BY Churn; 

-- 2.  Calculate the average usage frequency and average number of support calls
SELECT AVG(UsageFrequency) AS AvgUsage, AVG(SupportCalls) AS AvgSupportCalls
FROM UsageData; 

-- 3. Get the average and total spending across all customers
SELECT AVG(TotalSpend) AS AvgSpend, SUM(TotalSpend) AS TotalSpend
FROM Financials;


-- 4. Analyze the total spend for churned vs. non-churned customers
SELECT Churn, AVG(TotalSpend) AS AvgSpend, SUM(TotalSpend) AS TotalSpend
FROM ChurnData c
JOIN Financials f ON c.CustomerID = f.CustomerID
GROUP BY Churn;

-- 5. Analyze the average tenure of customers who churned vs. those who stayed
SELECT c.Churn, AVG(cu.Tenure) AS AvgTenure
FROM ChurnData c
JOIN Customers cu ON c.CustomerID = cu.CustomerID
GROUP BY c.Churn;

-- Advanced EDA Queries in SQL
-- 6. Churn rate by age groups (for example, 18-25, 26-35, etc.)
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age > 55 THEN '55+'
        ELSE 'Unknown'
    END AS AgeGroup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN c.Churn = 1 THEN 1 ELSE 0 END) AS TotalChurned,
    (SUM(CASE WHEN c.Churn = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS ChurnRate
FROM Customers cu
JOIN ChurnData c ON cu.CustomerID = c.CustomerID
GROUP BY AgeGroup; 

-- 7. Churn rate by gender
SELECT 
    cu.Gender,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN c.Churn = 1 THEN 1 ELSE 0 END) AS TotalChurned,
    (SUM(CASE WHEN c.Churn = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS ChurnRate
FROM Customers cu
JOIN ChurnData c ON cu.CustomerID = c.CustomerID
GROUP BY cu.Gender;  

-- 8. Churn rate based on customer tenure
SELECT 
    CASE
        WHEN cu.Tenure BETWEEN 0 AND 12 THEN '0-12 months'
        WHEN cu.Tenure BETWEEN 13 AND 24 THEN '13-24 months'
        WHEN cu.Tenure BETWEEN 25 AND 36 THEN '25-36 months'
        WHEN cu.Tenure > 36 THEN '36+ months'
        ELSE 'Unknown'
    END AS TenureGroup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN c.Churn = 1 THEN 1 ELSE 0 END) AS TotalChurned,
    (SUM(CASE WHEN c.Churn = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS ChurnRate
FROM Customers cu
JOIN ChurnData c ON cu.CustomerID = c.CustomerID
GROUP BY TenureGroup;

-- 9. Average spending of churned vs. non-churned customers
SELECT 
    c.Churn,
    AVG(f.TotalSpend) AS AvgSpend,
    SUM(f.TotalSpend) AS TotalSpend,
    COUNT(*) AS TotalCustomers
FROM Financials f
JOIN ChurnData c ON f.CustomerID = c.CustomerID
GROUP BY c.Churn; 

-- 10. Average number of support calls made by churned vs. non-churned customers
SELECT 
    c.Churn,
    AVG(u.SupportCalls) AS AvgSupportCalls,
    SUM(u.SupportCalls) AS TotalSupportCalls,
    COUNT(*) AS TotalCustomers
FROM UsageData u
JOIN ChurnData c ON u.CustomerID = c.CustomerID
GROUP BY c.Churn;


-- 11. Churn rate by subscription type and contract length
SELECT 
    s.SubscriptionType,
    s.ContractLength,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN c.Churn = 1 THEN 1 ELSE 0 END) AS TotalChurned,
    (SUM(CASE WHEN c.Churn = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS ChurnRate
FROM Subscriptions s
JOIN ChurnData c ON s.CustomerID = c.CustomerID
GROUP BY s.SubscriptionType, s.ContractLength;


-- Save Aggregated Data for Modeling:
-- Drop the existing view if it exists
DROP VIEW IF EXISTS CustomerSummary;

-- create the new view
CREATE VIEW CustomerSummary AS
SELECT 
    cu.CustomerID,
    cu.Age,
    cu.Gender,
    cu.Tenure,
    f.TotalSpend,
    u.UsageFrequency,
    u.SupportCalls,
    s.SubscriptionType,  -- Add this line for Subscription Type
    c.Churn
FROM Customers cu
JOIN Financials f ON cu.CustomerID = f.CustomerID
JOIN UsageData u ON cu.CustomerID = u.CustomerID
JOIN Subscriptions s ON cu.CustomerID = s.CustomerID  -- Add this JOIN for Subscription data
JOIN ChurnData c ON cu.CustomerID = c.CustomerID;

-- Drop the existing view if it exists
DROP VIEW IF EXISTS CustomerSummary;

-- Create the new view
CREATE VIEW CustomerSummary AS
SELECT 
    cu.CustomerID,
    cu.Age,
    cu.Gender,
    cu.Tenure,
    f.TotalSpend,
    u.UsageFrequency,
    u.SupportCalls,
    s.SubscriptionType,  -- Add this line for Subscription Type
    c.Churn
FROM Customers cu
JOIN Financials f ON cu.CustomerID = f.CustomerID
JOIN UsageData u ON cu.CustomerID = u.CustomerID
JOIN Subscriptions s ON cu.CustomerID = s.CustomerID  -- Add this JOIN for Subscription data
JOIN ChurnData c ON cu.CustomerID = c.CustomerID;



