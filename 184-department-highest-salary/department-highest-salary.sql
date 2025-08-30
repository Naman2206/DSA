# Write your MySQL query statement below
WITH ranked_salaries AS (
    SELECT e.id,
           e.name AS Employee,
           e.salary,
           e.departmentId,
           RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk
    FROM Employee e
)
SELECT d.name AS Department,
       r.Employee,
       r.salary AS Salary
FROM ranked_salaries r
JOIN Department d
     ON r.departmentId = d.id
WHERE r.rnk = 1;
