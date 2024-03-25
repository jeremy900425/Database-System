select Employee.Dno,count(*) as num_Employee
from Employee
where Employee.Salary > 30000
group by Employee.Dno
having Count(*) > 2