(select distinct Pnumber
from Project,Department,Employee
where Dnum=Dnumber and MgrSSN=Ssn and Lname="Wong")
union
(select distinct Pnumber
from Project,Work_on,Employee
where Pnumber=Pno and Essn=Ssn and Lname="Wong");