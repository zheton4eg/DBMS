USE PV_319_IMPORT;
SET DATEFIRST 1;
GO

--SELECT * FROM DaysOFF;

--EXEC sp_AddAllHolidaysFor 2025;

SELECT
		[Дата]		=	[date],
		[Праздник]	=	holiday_name
FROM	DaysOFF, Holidays
WHERE	holiday=holiday_id
ORDER BY [date];