USE PV_319_IMPORT;
GO

ALTER PROCEDURE sp_CountTeachersMonthSalary
		@teacher_last_name		AS	NVARCHAR(50),
		@year					AS	SMALLINT,
		@month					AS	TINYINT
AS
BEGIN
	DECLARE @start_date				    AS DATE = FORMATMESSAGE('%i-%i-01',@year,@month);
	DECLARE @end_date				    AS DATE =  DATEADD(MONTH,1,@start_date);
	DECLARE @number_of_spent_lessons AS TINYINT	=
	(
	SELECT  COUNT(spent)
	FROM	Schedule
	WHERE	teacher		=		(SELECT teacher_id FROM	Teachers WHERE last_name=@teacher_last_name)
	AND		[date]	BETWEEN @start_date AND @end_date
	AND		spent=1
	);
	
	DECLARE @teachers_rate		 AS SMALLMONEY = (SELECT rate FROM Teachers WHERE last_name= @teacher_last_name);
	DECLARE @salary				 AS SMALLMONEY = @teachers_rate * @number_of_spent_lessons;
	RETURN  @salary
END