CREATE PROCEDURE GetUserByCredentials
    @Username NVARCHAR(50),
    @Password NVARCHAR(256) -- Adjust size according to hash length
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PasswordHash VARBINARY(64); -- Example for SHA-256

    -- Generate the hash of the input password using a function similar to HASHBYTES
    SELECT @PasswordHash = HASHBYTES('SHA2_256', @Password);

    -- Query the user table with the hashed password
    SELECT UserId, Username, Email, FirstName, LastName
    FROM Users
    WHERE Username = @Username AND PasswordHash = @PasswordHash;
END
GO
