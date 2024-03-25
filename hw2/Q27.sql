select Fname,Lname
from Employee
where not exists(
	select Pnumber
    from Project
    where Dnum = 5
    and not exists(
		select *
        from Work_on
        where Work_on.Essn = Employee.Ssn and Work_on.Pno = Project.Pnumber
    )
)