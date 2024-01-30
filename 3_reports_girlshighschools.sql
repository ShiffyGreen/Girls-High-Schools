<<<<<<< HEAD
use GirlsHighSchoolsDB
go
--1)
select * 
from GirlsHighSchools g
where g.ConnectedToElementary = 'yes'

--2)
select g.TotalStudentBody 
from GirlsHighSchools g
order by g.TotalStudentBody desc

--3)
select TotalTuitionPerSchool = (g.FullTuition * g.PercentagePayingFull * .01 * g.TotalStudentBody) + (g.DiscountedTuition * (100-g.PercentagePayingFull) * .01 * g.TotalStudentBody), SchoolName
from GirlsHighSchools g
group by SchoolName, (g.FullTuition * g.PercentagePayingFull * .01 * g.TotalStudentBody) + (g.DiscountedTuition * (100-g.PercentagePayingFull) * .01 * g.TotalStudentBody)
=======
--1)
select * from GirlsHighSchools g
where g.ConnectedToElementary = 'yes'

--2)
select g.TotalStudentBody from GirlsHighSchools g
order by g.TotalStudentBody desc

--3)
select TotalTuitionPerSchool = (g.FullTuition * g.PercentagePayingFull * .01 * g.TotalStudentBody) + (g.DiscountedTuition * (100-g.PercentagePayingFull) * .01 * g.TotalStudentBody), SchoolName
from GirlsHighSchools g
group by SchoolName, (g.FullTuition * g.PercentagePayingFull * .01 * g.TotalStudentBody) + (g.DiscountedTuition * (100-g.PercentagePayingFull) * .01 * g.TotalStudentBody)
>>>>>>> fd79262e87a269a981226090ca5149d3249d6cc8
