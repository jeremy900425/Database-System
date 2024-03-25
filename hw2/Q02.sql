Select Pnumber, Dnum, Lname, Address, BDate 
From Project, Department, Employee
Where Dnum = Dnumber And MgrSSN=Ssn And Plocation="Stafford";