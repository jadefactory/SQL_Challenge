-- [ Question ]
-- Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:
-- Founder => Lead Manager => Senior Manager => Manager => Employee
-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

-- Note:

-- * The tables may contain duplicate records.
-- * The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

select A.company_code, 
       A.founder, 
       (select count(distinct lead_manager_code) from Lead_manager where company_code = A.company_code) as num_lead,
       (select count(distinct senior_manager_code) from Senior_manager where company_code = A.company_code) as num_senior,
       (select count(distinct manager_code) from Manager where company_code = A.company_code) as num_manager,
       (select count(distinct employee_code) from Employee where company_code = A.company_code) as num_employee
from Company A
order by company_code asc

-- https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true