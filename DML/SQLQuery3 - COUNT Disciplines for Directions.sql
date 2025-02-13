USE PV_319_IMPORT
GO

SELECT
			[N'Направление обучения']		=	direction_name,
			[N'Колличество дисциплин']			=	COUNT(direction_name)
FROM		Disciplines, Directions, DisciplinesDirectionsRelation
WHERE		discipline	=	discipline_id
AND			direction	=	direction_id
GROUP BY	direction_name
;