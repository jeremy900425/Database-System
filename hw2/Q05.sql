select Em1.Fname,Em1.Lname,Em2.Fname,Em2.Lname
from Employee as Em1, Employee as Em2
where Em2.Super_ssn = Em1.Ssn 