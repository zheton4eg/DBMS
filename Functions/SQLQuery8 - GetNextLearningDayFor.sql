USE PV_319_IMPORT
SET DATEFIRST 1;
GO

ALTER FUNCTION dbo.GetNextLearningDaysFor(@group_name AS NVARCHAR(10))RETURNS TINYINT
BEGIN
	DECLARE
		@current_day	AS TINYINT = DATEPART(WEEKDAY, dbo.GetLastDateForGroup(@group_name)),
		@next_day		AS TINYINT = IIF(@current_day<7, @current_day-1,0),
		@days			AS TINYINT = (SELECT weekdays FROM Groups WHERE group_name=@group_name);
	WHILE @next_day < 7
	BEGIN
		SET @next_day
	END

	RETURN @next_day;
END