-- HR Analytics Project
-- Employee Attrition Analysis
CREATE DATABASE hr_analytics;
USE hr_analytics;
-- Step 1: Data Exploration
SELECT*
FROM employee_attrition
LIMIT 10;

SELECT COUNT(*) AS Total_Employees
FROM employee_attrition;

DESCRIBE employee_attrition;

-- Step 2: Data Validation
-- check duplicate employees
SELECT EmployeeNumber,
COUNT(*) AS Duplicate_Count
FROM employee_attrition
GROUP BY EmployeeNumber
HAVING COUNT(*)>1;
 
-- EmployeeCount
SELECT DISTINCT EmployeeCount
FROM employee_attrition;

-- Over18
SELECT DISTINCT Over18
FROM employee_attrition;

-- StandardHours
SELECT DISTINCT StandardHours
FROM employee_attrition;

-- Check Attrition values
SELECT DISTINCT Attrition
FROM employee_attrition;

-- Step 3: SQL Business Analysis
-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM employee_attrition;
-- Attrition Count
SELECT COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition = 'Yes';
-- Active Employees
SELECT COUNT(*) AS Active_Employees
FROM employee_attrition
WHERE Attrition = 'No';
-- Attrition Rate
SELECT
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 /
COUNT(*),2
) AS Attrition_Rate
FROM employee_attrition;
-- Employees by Department
SELECT Department,
COUNT(*) AS Total_Employees
FROM employee_attrition
GROUP BY Department
ORDER BY Total_Employees DESC;
-- Attrition by Department
SELECT Department,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY Department
ORDER BY Attrition_Count DESC;
-- Employees by Gender
SELECT Gender,
COUNT(*) AS Total_Employees
FROM employee_attrition
GROUP BY Gender;
-- Attrition by Gender
SELECT Gender,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY Gender;
-- Attrition by Job Role
SELECT JobRole,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Count DESC;
-- Overtime vs Attrition
SELECT OverTime,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY OverTime;
-- Attrition by Education Field
SELECT EducationField,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY EducationField
ORDER BY Attrition_Count DESC;
-- Attrition by Marital Status
SELECT MaritalStatus,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY MaritalStatus
ORDER BY Attrition_Count DESC;
-- Average Monthly Income by Department
SELECT Department,
ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_Monthly_Income DESC;
-- Average Monthly Income by Job Role
SELECT JobRole,
ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income
FROM employee_attrition
GROUP BY JobRole
ORDER BY Avg_Monthly_Income DESC;
-- Average Age by Department
SELECT Department,
ROUND(AVG(Age),1) AS Average_Age
FROM employee_attrition
GROUP BY Department;
-- Employees by Business Travel
SELECT BusinessTravel,
COUNT(*) AS Total_Employees
FROM employee_attrition
GROUP BY BusinessTravel;
-- Attrition by Business Travel
SELECT BusinessTravel,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY BusinessTravel
ORDER BY Attrition_Count DESC;
-- Average Years at Company by Department
SELECT Department,
ROUND(AVG(YearsAtCompany),2) AS Avg_Years
FROM employee_attrition
GROUP BY Department;
-- Job Satisfaction Distribution
SELECT JobSatisfaction,
COUNT(*) AS Employees
FROM employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;
-- Environment Satisfaction Distribution
SELECT EnvironmentSatisfaction,
COUNT(*) AS Employees
FROM employee_attrition
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

-- Step 4: Advanced SQL Analysis
-- 1. Attrition by Age Group
SELECT
CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    ELSE '46+'
END AS Age_Group,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY Age_Group
ORDER BY Attrition_Count DESC;
-- 2. Attrition by Salary Category
SELECT
CASE
    WHEN MonthlyIncome < 5000 THEN 'Low Salary'
    WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
    ELSE 'High Salary'
END AS Salary_Category,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY Salary_Category
ORDER BY Attrition_Count DESC;
-- 3. Top 5 Highest Paying Job Roles
SELECT JobRole,
ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM employee_attrition
GROUP BY JobRole
ORDER BY Average_Salary DESC
LIMIT 5;
-- 4. Top 5 Job Roles with Highest Attrition
SELECT JobRole,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count
FROM employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Count DESC
LIMIT 5;
-- 5. Department-wise Attrition Rate
SELECT
Department,
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count,
COUNT(*) AS Total_Employees,
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 / COUNT(*),2
) AS Attrition_Rate
FROM employee_attrition
GROUP BY Department
ORDER BY Attrition_Rate DESC;
-- 6. Average Years Since Last Promotion
SELECT Department,
ROUND(AVG(YearsSinceLastPromotion),2) AS Avg_Years_Since_Last_Promotion
FROM employee_attrition
GROUP BY Department;
-- 7. Average Total Working Years by Job Role
SELECT JobRole,
ROUND(AVG(TotalWorkingYears),2) AS Avg_Working_Years
FROM employee_attrition
GROUP BY JobRole
ORDER BY Avg_Working_Years DESC;
-- 8. Employees with Highest Monthly Income
SELECT EmployeeNumber,
JobRole,
Department,
MonthlyIncome
FROM employee_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10;
-- 9. Average Monthly Income by Gender
SELECT Gender,
ROUND(AVG(MonthlyIncome),2) AS Average_Monthly_Income
FROM employee_attrition
GROUP BY Gender;
-- 10. Average Job Satisfaction by Department
SELECT Department,
ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_Job_Satisfaction DESC;
 
 -- Step 5: SQL Window Functions & CTEs
 -- Rank Job Roles by Average Salary
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary,
    RANK() OVER (ORDER BY AVG(MonthlyIncome) DESC) AS Salary_Rank
FROM employee_attrition
GROUP BY JobRole;
-- Rank Departments by Attrition Count
SELECT
    Department,
    COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Attrition_Count,
    DENSE_RANK() OVER (
        ORDER BY COUNT(CASE WHEN Attrition='Yes' THEN 1 END) DESC
    ) AS Department_Rank
FROM employee_attrition
GROUP BY Department;
-- Highest Paid Employee in Each Department
WITH SalaryRank AS
(
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        MonthlyIncome,
        ROW_NUMBER() OVER (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS Salary_Position
    FROM employee_attrition
)
SELECT *
FROM SalaryRank
WHERE Salary_Position = 1;
-- Average Salary Compared to Company Average
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary,
    (
        SELECT ROUND(AVG(MonthlyIncome),2)
        FROM employee_attrition
    ) AS Company_Average_Salary
FROM employee_attrition
GROUP BY JobRole;
-- Employees Earning Above Department Average Salary
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome
FROM employee_attrition e
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM employee_attrition
    WHERE Department = e.Department
);
-- Salary Rank Within Each Department
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    RANK() OVER (
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
    ) AS Salary_Rank
FROM employee_attrition;
-- Employees with Above Average Experience
SELECT
    EmployeeNumber,
    JobRole,
    TotalWorkingYears
FROM employee_attrition
WHERE TotalWorkingYears >
(
    SELECT AVG(TotalWorkingYears)
    FROM employee_attrition
);
-- Attrition Percentage by Department
SELECT
    Department,
    ROUND(
        COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 /
        COUNT(*),2
    ) AS Attrition_Percentage
FROM employee_attrition
GROUP BY Department
ORDER BY Attrition_Percentage DESC;
-- Longest Serving Employees
SELECT
    EmployeeNumber,
    Department,
    YearsAtCompany,
    RANK() OVER (
        ORDER BY YearsAtCompany DESC
    ) AS Tenure_Rank
FROM employee_attrition;
-- Department Summary using CTE
WITH DepartmentSummary AS
(
    SELECT
        Department,
        COUNT(*) AS Total_Employees,
        ROUND(AVG(MonthlyIncome),2) AS Average_Salary
    FROM employee_attrition
    GROUP BY Department
)
SELECT *
FROM DepartmentSummary;
