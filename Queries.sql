select *
from Visit
where fileNum=1981752

select illness
from (select illness, count(visitCode)cnt
 from Diagnosis
 where visitCode in(select visitCode
 from Visit
 where visitDate>=d1 and visitDate<=d2)
 group by illness)
where cnt=max (cnt)

select sum(amount)
from PayInsurance
where payDate>=d1 and payDate<=d2 and insCode in(select insCode
 from Insurance
 where insName=”Taamin Ejtemaei”)

select age, count(fileNum)
from Patient
where fileNum in(select fileNum
 from Visit
 where visitDate between d1 and d2)
group by age

select avg(age)
from Patient

select medName, sideEffect
from Medicine
where medCode in(select medCode
 from Diagnosis
 where visitCode in(select visitCode
 from Visit
 where fileNum=1981752 and visitDate=d1))

select insName
from Insurance
where insCode in(select insCode
 from Patient
 where fileNum=1981752)

(select medName
from Medicine
where medCode in(select medCode
 from MedInterfere
 where intMed in(select medCode
 from Medicine
 where medName=”Aspirin”)))
union
(select medName
from Medicine
where medCode in(select intMed
 from MedInterfere
 where medCode in(select medCode
 from Medicine
 where medName=”Aspirin”)))
 
 select docName
from (select docName, count(visitCode)cnt
from Refer
 group by docName)
where cnt=max(cnt)

select result
from Paraclinic
where visitCode in(select visitCode
 from Visit
 where fileNum=1981752 and visitDate=d1)
 
 select fileNum, count(visitCode)
from Visit
group by fileNum

select sum(patientPart)
from Visit
where fileNum=1981752

select insCode, sum(amount)
from PayInsurance
group by insCode

select address, phone
from Operator
where lastName=”Ahmadi”

select medName
from Medicine
where medName like ‘%min%’

select signCode
from (select signCode, count(visitCode)cnt
 from VisitSign
 where visitCode in(select visitCode
 from Visit
 where visitDate Between d1 and d2)
 group by signCode)
where cnt=max(cnt)

select fileNum, firstName, lastName
from Patient
where fileNum in(select fileNum
 from Visit
 where visitDate>=d1 and visitDate<=d2
 and visitCode in(select visitCode
 from VisitSign
 where signCode in(select signCode
 from Sign
 where title=”headache”)))

select payDate, amount
from PayInsurance
where payDate=(select max(payDate)
 from PayInsurance
 where insCode in(select insCode
 from Insurance
 where insName=”Taamin Ejtemaei”))
 
 select insName
from Insurance
where insPercent=(select max(insPercent)
 from Insurance)
 
 select medCode,amount
from GiveMed
where diagnosisCode in(select Code
 from Diagnosis
 where visitCode in(select visitCode
 from Visit
 where visitDate=d1 and fileNum=1981752))