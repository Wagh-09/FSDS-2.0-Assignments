WITH SalaryMonths AS (
    SELECT
        EmployeeID,
        DATE_TRUNC('month', SalaryDate) AS Month,
        SUM(Salary) AS MonthlySalary
    FROM EmployeeSalary
    GROUP BY EmployeeID, DATE_TRUNC('month', SalaryDate)
)

SELECT
    sm.EmployeeID,
    sm.Month,
    SUM(sml.MonthlySalary) OVER (PARTITION BY sm.EmployeeID ORDER BY sm.Month DESC ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING) AS CumulativeSum
FROM SalaryMonths sm
JOIN SalaryMonths sml ON sm.EmployeeID = sml.EmployeeID AND sm.Month = sml.Month
ORDER BY sm.EmployeeID ASC, sm.Month DESC;
