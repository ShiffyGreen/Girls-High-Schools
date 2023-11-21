use SchoolsDB
go

drop table if exists HighSchool
go

create table dbo.HighSchool(
    HighSchoolId int not null identity primary key,
    SchoolName varchar(30) not null constraint ck_HighSchool_SchoolName_cannot_be_blank check(SchoolName > '') constraint u_HighSchool_SchoolName unique,
    PhoneNumber varchar(15) not null constraint ck_HighSchool_PhoneNumber_area_code_must_be_732 check(PhoneNumber like '732%'),
    SchoolAddress varchar(200) not null constraint ck_HighSchool_SchoolAddress_cannot_be_blank check(SchoolAddress > ''),
    Principal varchar(50) not null constraint ck_HighSchool_Principal_cannot_be_blank check(Principal > ''),
    --AF Can any of these grades have 0 students?
    Freshies int not null constraint ck_HighSchool_Freshies_must_be_greater_than_zero check(Freshies > 0),
    Sophies int not null constraint ck_HighSchool_Sophies_must_be_greater_than_zero check(Sophies > 0),
    Juniors int not null constraint ck_HighSchool_Juniors_must_be_greater_than_zero check(Juniors > 0),
    Seniors int null constraint ck_HighSchool_Seniors_cannot_be_negative check(Seniors >= 0),
    TotalStudentBody as Freshies + Sophies + Juniors + Seniors,
    Tuition decimal(7,2) not null constraint ck_HighSchool_Tuition_must_be_greater_than_zero check(Tuition > 0),
    DiscountedTuition decimal(7, 2) null,
    PercentagePayingFullTuition decimal(3,2) not null constraint ck_HighSchool_PercentagePayingFullTuition_between_0_and_1 check(PercentagePayingFullTuition between 0 and 1),
    HasElementarySchool bit not null constraint df_HighSchool_HasElementarySchool default 0,
    Budget decimal(14,2) not null constraint ck_HighSchool_Budget_greater_than_zero check(Budget > 0),
    constraint ck_HighSchool_Tuition_must_be_greater_than_DiscountedTuition check(Tuition > DiscountedTuition)
)