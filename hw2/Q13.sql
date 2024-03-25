select Employee.Fname,Employee.Lname
from Employee
where not exists ( 
    SELECT 1
    FROM Dependent
    WHERE Employee.Ssn = Dependent.Essn
);

