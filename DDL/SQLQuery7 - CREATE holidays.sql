USE PV_319_IMPORT;
DROP TABLE Holidays;

CREATE TABLE Holidays
(
	holiday_id		TINYINT		PRIMARY KEY,
	holiday_name	NVARCHAR(150)NOT NULL,			
);
GO

INSERT Holidays
		(holiday_id, holiday_name)
VALUES	
		(1,		N'���������� ��������'),
		(2,		N'23 �������'),
		(3,		N'8 �����'),
		(4,		N'�����'),
		(5,		N'������� ��������'),
		(6,		N'������ ��������'),
		(7,		N'���� ��������� ��������')
		;