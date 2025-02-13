USE PV_319_IMPORT;
GO

SELECT
			discipline_name		AS N'Дисциплина',
			number_of_lessons	AS N'Кол-во занятий'
FROM		Directions, Disciplines, DisciplinesDirectionsRelation
WHERE		direction	=	direction_id
AND			discipline  =	discipline_id	
AND			direction_name LIKE N'Разработка%'
;
GO

--SELECT * FROM Disciplines

--SELECT
--			[Направление обучения]	=	direction_name,
--			[Кол-во дисциплин]		=	COUNT(discipline)
--FROM		Disciplines, Directions, DisciplinesDirectionsRelation
--WHERE		discipline		=		discipline_id
--AND			direction		=		direction_id
--GROUP BY	direction_name
--;

SELECT
			[Напрвление обучения]	=	direction_name,
			[Кол - во занятий]		=	SUM(number_of_lessons)
FROM		Disciplines,Directions, DisciplinesDirectionsRelation
WHERE		direction		=		direction_id
AND			discipline		=		discipline_id
GROUP BY	direction_name
;



