USE PV_319_DDL
GO

SELECT
group_name			AS N'������',
COUNT(student_id)	AS N'���-�� ���������'

FROM		Students, Groups
WHERE	    [group]=group_id
GROUP BY	group_name
ORDER BY	N'���-�� ���������'
;