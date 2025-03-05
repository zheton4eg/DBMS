USE PV_319_IMPORT
GO

ALTER PROCEDURE sp_PrintScheduleForGroupPeriod
	@group_name		 NVARCHAR(16),
	@start_date		 DATE,
	@end_date		 DATE
AS
BEGIN
	SELECT
			[������]			=	group_name,
			[����������]		=	discipline_name,
			[�������������]		=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
			[����]				=	DATENAME(WEEKDAY, [date]),
			[����]				=	[date],
			[�����]				=	[time],
			[������]			=	IIF(spent = 1, N'���������', N'�������������')
	FROM	Schedule, Groups, Disciplines, Teachers
	WHERE	[group]				=	group_id
	AND		discipline			=	discipline_id
	AND		teacher				=	teacher_id
	AND		[date]	BETWEEN	@start_date AND @end_date;
END