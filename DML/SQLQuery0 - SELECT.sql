USE PV_319_DDL;
GO

SELECT 
--last_name AS N'�������',
--first_name AS N'���',
--middle_name AS N'��������',
last_name + ' ' + first_name +' ' + middle_name AS N'�.�.�. ��������',
birth_date AS N'���� ��������',
[group_name] AS N'������',
direction_name AS N'����������� ��������'
FROM Students, Groups,Directions
WHERE [group]=group_id
AND direction = direction_id
ORDER BY N'���� ��������' DESC
;