CREATE PROCEDURE GetUserByCredentials
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(256),
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @PasswordHash VARBINARY(64); -- Example for SHA-256
    SELECT @PasswordHash = HASHBYTES('SHA2_256', @PasswordHash);
    SELECT UserId, Username, Email, FirstName, LastName
    FROM Users
    WHERE Username = @Username AND PasswordHash = @PasswordHash;

END
GO
