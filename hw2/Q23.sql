select Pnumber, Pname,count(Work_on.Essn) as num_Employee
from Project
join Work_on on Project.Pnumber = Work_on.Pno
group by Pnumber
having count(Work_on.Essn) > 2