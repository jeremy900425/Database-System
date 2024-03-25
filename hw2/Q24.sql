select Pnumber, Pname,count(Work_on.Essn) as num_Porject
from Project
join Work_on on Project.Pnumber = Work_on.Pno
join Employee on Work_on.Essn = Employee.Ssn
where Dno = "5"
group by Pnumber