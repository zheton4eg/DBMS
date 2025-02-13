USE PV_319_IMPORT;
GO

SELECT
			discipline_name		AS N'����������',
			number_of_lessons	AS N'���-�� �������'
FROM		Directions, Disciplines, DisciplinesDirectionsRelation
WHERE		direction	=	direction_id
AND			discipline  =	discipline_id	
AND			direction_name LIKE N'����������%'
;
GO

--SELECT * FROM Disciplines

--SELECT
--			[����������� ��������]	=	direction_name,
--			[���-�� ���������]		=	COUNT(discipline)
--FROM		Disciplines, Directions, DisciplinesDirectionsRelation
--WHERE		discipline		=		discipline_id
--AND			direction		=		direction_id
--GROUP BY	direction_name
--;

SELECT
			[���������� ��������]	=	direction_name,
			[��� - �� �������]		=	SUM(number_of_lessons)
FROM		Disciplines,Directions, DisciplinesDirectionsRelation
WHERE		direction		=		direction_id
AND			discipline		=		discipline_id
GROUP BY	direction_name
;



