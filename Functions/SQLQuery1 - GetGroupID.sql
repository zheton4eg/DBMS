USE PV_319_IMPORT;
GO

ALTER FUNCTION GetGroupID
(
	@group_name AS NVARCHAR(150)
)
RETURNS INT
BEGIN
	RETURN (SELECT group_id FROM Groups WHERE group_name=@group_name);
	END;