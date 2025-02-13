USE PV_319_IMPORT
GO

SELECT
FROM	Directions, Disciplines, DisciplinesDirectionsRelation
WHERE direction		=		direction_id
AND	  discipline	=		discipline_id	
;