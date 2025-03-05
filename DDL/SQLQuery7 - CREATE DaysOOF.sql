USE PV_319_IMPORT
GO

CREATE TABLE DaysOFF
(
	[date]		 DATE		PRIMARY KEY,
	holiday		 TINYINT	CONSTRAINT FK_DO_Holidays REFERENCES Holidays(holiday_id)
);