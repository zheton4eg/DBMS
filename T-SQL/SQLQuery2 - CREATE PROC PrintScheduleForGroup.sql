USE PV_319_IMPORT
GO

ALTER PROCEDURE sp_PrintScheduleForGroup
@group_name				NVARCHAR(16),
@discipline_name		NVARCHAR(150) =N''
AS
BEGIN

	SELECT
				[������]		=	group_name,
				[����������]	=	discipline_name,
				[�������������] =	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
				[����]			=	DATENAME(WEEKDAY,[date]),
				[����]			=	[date],
				[�����]			=	[time],
				[������]		=	IIF(spent=1, N'���������', N'�������������')
	FROM		Schedule, Groups, Disciplines, Teachers
	WHERE		[group]			=	group_id
	AND			discipline		=	discipline_id
	AND			teacher			=	teacher_id
	AND			group_name		=	@group_name
	AND			discipline_name LIKE	IIF(@discipline_name = N'', N'%', @discipline_name)
	ORDER BY [date]
	;
	END