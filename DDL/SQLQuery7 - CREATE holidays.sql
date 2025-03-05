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
		(1,		N'Новогодние каникулы'),
		(2,		N'23 февраля'),
		(3,		N'8 марта'),
		(4,		N'Пасха'),
		(5,		N'майские каникулы'),
		(6,		N'Летние каникулы'),
		(7,		N'День народного единства')
		;