select distinct W1.Essn
from Work_on as W1
join Work_on as W2 on W1.Pno = W2.Pno
where W2.Essn = '123456789'