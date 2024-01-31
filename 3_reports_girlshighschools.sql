use GirlsHighSchoolsDB
go
--1)
select * 
from GirlsHighSchools g
where g.ConnectedToElementary = 0

--2)
select g.TotalStudentBody 
from GirlsHighSchools g
order by g.TotalStudentBody desc

--3)
select TotalTuitionPerSchool = (g.FullTuition * g.PercentagePayingFull * .01 * g.TotalStudentBody) + (g.DiscountedTuition * (100-g.PercentagePayingFull) * .01 * g.TotalStudentBody), SchoolName
from GirlsHighSchools g
group by SchoolName, (g.FullTuition * g.PercentagePayingFull * .01 * g.TotalStudentBody) + (g.DiscountedTuition * (100-g.PercentagePayingFull) * .01 * g.TotalStudentBody)
