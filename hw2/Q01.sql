Select Fname, Lname, Address
From Employee as em, Department as de
Where de.Dname="Research" And de.Dnumber=em.Dno;