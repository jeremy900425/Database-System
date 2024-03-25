select Fname,Lname,1.15*Salary 
from Employee,Work_on,Department
where Ssn=Essn and Dno=Dnumber and Dname="Research"