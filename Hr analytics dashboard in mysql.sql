use hr_analytics;

-- 1st KPI = Average Attrition rate of all departments.

SELECT Department, AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Avg_Attrition_Rate
FROM hr_analytics.database GROUP BY Department;

-- ===========================================================================================================================================

-- 2nd KPI = Average Hourly rate of Male reserach scientist

SELECT AVG(Hourly_Rate) AS Avg_Hourly_Rate FROM hr_analytics.database WHERE Gender = 'Male' AND Job_Role = 'Research Scientist';

-- ===========================================================================================================================================

-- 3rd KPI = Attrition rate Vs Monthly income stats

SELECT CONCAT(FLOOR((Monthly_Income - 1000) / 10000) * 10000 + 1000, '-', FLOOR((Monthly_Income - 1000) / 10000 + 1) * 10000) 
    AS Monthly_Income_Group, AVG(Attrition = 'Yes') AS Attrition_Rate FROM hr_analytics.database WHERE Monthly_Income 
    BETWEEN 1000 AND 51000 GROUP BY Monthly_Income_Group ORDER BY Monthly_Income_Group ASC;


-- ===========================================================================================================================================

-- 4th KPI = Average working years for each Department

SELECT Department, AVG(Total_Working_Years) AS Avg_Working_Years FROM hr_analytics.database GROUP BY Department;


-- ===========================================================================================================================================

-- 5th KPI = Job Role Vs Work life balance

SELECT Job_Role, AVG(Work_Life_Balance) AS Avg_Work_Life_Balance FROM hr_analytics.database GROUP BY Job_Role;


-- ===========================================================================================================================================

-- 6th KPI = Attrition rate Vs Year since last promotion relation

SELECT CONCAT(FLOOR(Years_Since_Last_Promotion / 10) * 10, '-', FLOOR(Years_Since_Last_Promotion / 10) * 10 + 9) AS 
Years_Since_Last_Promotion_Group, AVG(Attrition = 'Yes') AS Attrition_Rate FROM hr_analytics.database
GROUP BY Years_Since_Last_Promotion_Group ORDER BY Years_Since_Last_Promotion_Group ASC;


