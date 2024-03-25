select Fname, Lname
from Employee
where (select count(*)
		from Dependent
        where Ssn=Essn) >= 2