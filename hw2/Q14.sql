select Fname, Lname
from Employee
where exists (select * from Department where Ssn = MgrSSN)
  and exists (select * from Dependent  where Essn = Ssn);