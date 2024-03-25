select distinct Employee.Fname
from Employee, Dependent
where Ssn = Essn
and Fname = Dependent_name
and Employee.Sex = Dependent.Sex;
