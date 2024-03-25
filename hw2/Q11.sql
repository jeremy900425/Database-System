select distinct Fname,Lname,Pname,Dno 
from Employee,Work_on,Department,Project 
where Ssn=Essn and Pno=Pnumber  
order by Dno DESC, LName ASC, FName ASC 
