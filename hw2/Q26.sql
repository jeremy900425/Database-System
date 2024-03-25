select Dname
from Employee,Department
where Employee.Salary > 30000 and Department.Dnumber=Employee.Dno
group by Employee.Dno
having Count(*) > 2