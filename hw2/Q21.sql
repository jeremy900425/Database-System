select Dno, count(*) as num_employee, avg(Salary) as avg_salary
from Employee
group by Dno
