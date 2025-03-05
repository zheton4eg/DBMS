USE PV_319_IMPORT
GO

ALTER PROCEDURE dbo.sp_SetScheduleForStacionarGroup
		@group_name			NVARCHAR(16),
		@discipline_name	NVARCHAR(150),
		@teacher_last_name	NVARCHAR(50),
		@start_date			DATE,
		@time				TIME(0)
AS
BEGIN
SET DATEFIRST 1;

DECLARE @group				AS INT		= (SELECT group_id			FROM Groups	     WHERE group_name = @group_name);
DECLARE @discipline			AS SMALLINT	= (SELECT discipline_id		FROM Disciplines WHERE discipline_name LIKE @discipline_name);
DECLARE @teacher			AS SMALLINT = (SELECT teacher_id		FROM Teachers	 WHERE last_name = @teacher_last_name);
DECLARE @date				AS DATE		= @start_date;
DECLARE @number_of_lessons	AS TINYINT  = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id=@discipline);
DECLARE @lesson				AS TINYINT  = 1;

WHILE (@lesson<=@number_of_lessons)
BEGIN
		PRINT(@date);
		PRINT(DATENAME(WEEKDAY,@date));
		PRINT(@lesson);
		PRINT(@time);
		IF NOT EXISTS (SELECT * FROM Schedule WHERE[group]=@group AND discipline=@discipline AND [date]=@date AND [time]=@time)
		BEGIN
			INSERT Schedule
					([group], discipline,teacher,[date],[time],spent)
			VALUES		(@group,@discipline,@teacher,@date,@time,IIF(@date<GETDATE(),1,0));
		END

		SET @lesson=@lesson+1;

		PRINT(@lesson);
		PRINT(DATEADD(MINUTE,95,@time));
		IF NOT EXISTS (SELECT * FROM Schedule WHERE [group]=@group AND discipline=@discipline AND [date]=@date AND [time]=DATEADD(minute, 95, @time))
			BEGIN
		INSERT Schedule	
					([group], discipline, teacher, [date],[time],spent)
		VALUES		(@group, @discipline, @teacher, @date, DATEADD(MINUTE,95,@time),IIF(@date<GETDATE(),1,0));
			END
		SET @lesson=@lesson+1;
	
		PRINT('----------------------------');
		IF(DATEPART(WEEKDAY,@date)=6)
		BEGIN
			SET @date=DATEADD(DAY, 3,@date);
		END
		ELSE
		BEGIN
			SET @date =DATEADD(DAY, 2,@date);
			END
		END
END