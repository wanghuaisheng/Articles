DECLARE @VersionNumber NVARCHAR(50);
DECLARE @AppKey NVARCHAR(50);
SET @VersionNumber='2016.10.27.1'--'2016.9.20.1','2016.9.22.1','2016.9.22.2','2016.9.30.1','2016.10.27.1'
SET @AppKey='KD';

SELECT * FROM [UPDATE_PatchFile] WHERE AppKey=@AppKey AND PackageId IN (SELECT PackageId FROM [Update_PatchPackage] WHERE  AppKey=@AppKey AND VersionNumber=@VersionNumber)

SELECT * FROM [Update_PatchPackage] WHERE AppKey=@AppKey AND VersionNumber=@VersionNumber;

SELECT * FROM [Update_UpdateAppClient] WHERE AppKey=@AppKey AND VersionNumber=@VersionNumber;

SELECT * FROM [Update_UpdateLog] WHERE  AppKey=@AppKey AND NewVersion=@VersionNumber;


DELETE FROM [UPDATE_PatchFile] WHERE AppKey=@AppKey AND PackageId IN (SELECT PackageId FROM [Update_PatchPackage] WHERE  AppKey=@AppKey AND VersionNumber=@VersionNumber)

DELETE FROM [Update_PatchPackage] WHERE AppKey=@AppKey AND VersionNumber=@VersionNumber;

DELETE FROM [Update_UpdateAppClient] WHERE AppKey=@AppKey AND VersionNumber=@VersionNumber;

DELETE FROM [Update_UpdateLog] WHERE  AppKey=@AppKey AND NewVersion=@VersionNumber;
