select Fname, Lname from employee
where not exists
(select Pnumber from Project where Dnum=5
and Pnumber not in
(select Pno from Work_on where Ssn=Essn));