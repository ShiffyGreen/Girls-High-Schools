use SchoolsDB
go
--1) List of how many schools are connected to an elementary school.  
select schoolcount = count(h.HighSchoolId)
from HighSchool h
where h.HasElementarySchool = 1
/*2) Parents want to know the size of the schools, since they want their daughters to be noticed. 
   Show a list of each school’s number of students, from greatest to lowest. */
select h.SchoolName, h.TotalStudentBody
from HighSchool h
order by h.TotalStudentBody desc
/*3) I want to know which schools are financially secure.  
     A) What is the total of the tuition money coming in per school? 
     B)How does this compare to the school’s yearly budget? Show me a column for the schools that have more money coming in than spent, and for those that are in debt since their budget is more than their tuition 
     C)Is the school’s budget increasing or decreasing by the year? 
     D)Show me the two schools that seem to be the most secure based on this data */
--A
select h.schoolname, TotalYearlyTuition = ((h.TotalStudentBody * h.PercentagePayingFullTuition) * h.Tuition) + ((h.TotalStudentBody * (1 - h.PercentagePayingFullTuition)) * h.DiscountedTuition)
from HighSchool h
group by h.SchoolName, h.TotalStudentBody, h.PercentagePayingFullTuition, h.Tuition, h.DiscountedTuition
--B
;
with x as(
    select h.schoolname, TotalYearlyTuition = ((h.TotalStudentBody * h.PercentagePayingFullTuition) * h.Tuition) + ((h.TotalStudentBody * (1 - h.PercentagePayingFullTuition)) * h.DiscountedTuition)
    from HighSchool h
    group by h.SchoolName, h.TotalStudentBody, h.PercentagePayingFullTuition, h.Tuition, h.DiscountedTuition
)
select h.schoolname, x.TotalYearlyTuition, h.budget, InDebt = case when x.TotalYearlyTuition > h.Budget then 'false' else 'true' end
from HighSchool h
join x 
on h.SchoolName = x.SchoolName
--C
--AF How can I know if the school's budget is increasing or decreasing by the year?

--D ;
with x as(
    select h.schoolname, TotalYearlyTuition = ((h.TotalStudentBody * h.PercentagePayingFullTuition) * h.Tuition) + ((h.TotalStudentBody * (1 - h.PercentagePayingFullTuition)) * h.DiscountedTuition)
    from HighSchool h
    group by h.SchoolName, h.TotalStudentBody, h.PercentagePayingFullTuition, h.Tuition, h.DiscountedTuition
)
select top 2 h.schoolname, x.TotalYearlyTuition, h.budget, Profit = x.TotalYearlyTuition - h.Budget, InDebt = case when x.TotalYearlyTuition > h.Budget then 'false' else 'true' end
from HighSchool h
join x 
on h.SchoolName = x.SchoolName
order by x.TotalYearlyTuition - h.Budget desc