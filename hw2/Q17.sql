select Fname,Lname
from Employee
where Salary > (
select max(Salary)
from Employee
where Dno = "5"
)

