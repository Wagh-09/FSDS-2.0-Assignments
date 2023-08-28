WITH RankedSalaries AS (
    SELECT
        EmployeeID,
        CompanyID,
        Salary,
        ROW_NUMBER() OVER (PARTITION BY CompanyID ORDER BY Salary) AS RowAsc,
        ROW_NUMBER() OVER (PARTITION BY CompanyID ORDER BY Salary DESC) AS RowDesc
    FROM Employee
)

SELECT
    CompanyID,
    AVG(Salary) AS MedianSalary
FROM RankedSalaries
WHERE RowAsc = RowDesc OR RowAsc + 1 = RowDesc OR RowAsc = RowDesc + 1
GROUP BY CompanyID;
