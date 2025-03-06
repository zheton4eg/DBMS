USE PV_319_IMPORT;
SET DATEFIRST 1;
GO

PRINT(dbo.GetGroupID(N'PV_319'));
PRINT(dbo.GetDisciplineID(N'Hardware%'));
--EXEC sp_PrintScheduleForGroup N'PV_319';
PRINT(dbo.CountSpentLessons(N'PV_319',N'Процедурное%'));
PRINT(dbo.GetNewYearHolidaysStartDate(2025));
PRINT(dbo.GetSummerHolidaysStart(2023));
PRINT(dbo.GetHolidaysDuration(N'Нов%'));