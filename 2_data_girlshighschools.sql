delete GirlsHighSchools
go

insert GirlsHighSchools (SchoolName, SchoolAddress, SchoolPhoneNumber, SchoolPrincipal, NumOfFreshies, NumOfSophies, NumOfJuniors, NumOfSeniors, FullTuition, DiscountedTuition, PercentagePayingFull, YearlyBudget)
select 'Oros Bais Yaakov', '1995 Rutgers University Blvd', '(732) 370-6049', 'Mrs. Tamara Epstein', 140, 145, 150, 125, 4500, 3000, 75, 2158000 
union select 'Meiras Bais Yaakov', '500 Vermont Ave', '(732) 886-5854', 'Rebbitzen Paretzky', 107, 94, 63, null, 4200, 2900, 45, 1600500 
union select 'Bais Leah', '8745 Lanes Mill Rd', '(732) 773-8796', 'Mrs. Yocheved Miller', 73, 85, 80, 77, 4100, 1555, 74, 2459120 
union select 'Shiras Devorah', '436 Oak Street', '(732) 961-1283', 'Mrs. Devorah Feifer', 170, 165, 160, 155, 5500, 2000, 90, 2400000 
union select 'Bais Yaakov', '452 James Street','(732) 508-0138', 'Mrs. Sori Schechter', 167, 160, 150, 155, 4000, 3000, 75, 2100000 
union select 'Bais Fishy', '436 Oak Street', '(732) 569-1314', 'Mrs. Shiffy Green', 110, 105, 100, 95, 10000, 5999, 100, 1000000 
go