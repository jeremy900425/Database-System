select sum(Salary),max(Salary),min(Salary),avg(Salary)
from Employee,Department
where Dno = Dnumber and Dname = "Research"


