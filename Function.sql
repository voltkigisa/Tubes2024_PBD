-- fungsi membuat kode kelas 
CREATE FUNCTION GenerateRoomCode (@floor INT, @classId INT)
-- floor : lantai berapa si ruangan itu
-- classId : id ruangan nya sendiri (pastikan berurutan)
RETURNS CHAR(5)
AS
BEGIN
    DECLARE @classCode CHAR(5)
    IF @classId < 10
        SET @classCode = '0' + CAST(@classId AS CHAR(1))
    ELSE
        SET @classCode = CAST(@classId AS CHAR(2))
    RETURN 'RS' + CAST(@floor AS CHAR(1)) + @classCode
END;
-- drop FUNCTION GenerateRoomCode;