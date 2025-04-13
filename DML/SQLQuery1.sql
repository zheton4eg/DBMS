USE PV_319_IMPORT;
GO

--SELECT
--			direction_name,
--			[groups_count]		=	COUNT(DISTINCT group_id),
--			[students_count]	=	COUNT(DISTINCT stud_id)
--FROM	Students,Groups,Directions
--WHERE		direction			=	direction_id
--AND			[group]				=	group_id
--GROUP BY	direction_name
--;

SELECT
				direction_name,
				COUNT(DISTINCT group_id)		AS N'Колличество групп',
				COUNT(DISTINCT stud_id)		AS N'Колличество студентов'
FROM			Students
RIGHT JOIN		Groups		ON	([group]	=	group_id)
RIGHT JOIN		Directions	ON	([direction]=	direction_id)
GROUP BY		direction_name
;