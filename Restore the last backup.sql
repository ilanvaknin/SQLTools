USE [master]
GO
/****** Object:  StoredProcedure [dbo].[usp_restore_db]    Script Date: 12/05/2024 09:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ylan Ouaknine
-- Create date: 2023-10-12
-- Description:	Generic store procedure for restoring db
-- =============================================
ALTER PROCEDURE [dbo].[usp_restore_db](@dbToRestore nvarchar(50) out)
AS
BEGIN
	SET NOCOUNT ON;

	declare @physical_device_name nvarchar(260);
	select top 1 @physical_device_name=bmf.physical_device_name
	from msdb.dbo.backupmediafamily bmf
	left join msdb.dbo.backupset bs ON bs.media_set_id = bmf.media_set_id
	where bs.database_name = @dbToRestore and bmf.device_type=2 and bmf.physical_device_name like '%'+replace(convert(varchar(10),dateadd(day,-1,getdate()),120),'-','_')+'%'
	order by backup_start_date desc

	declare @backupSetId as int
	select @backupSetId = position from msdb..backupset where database_name=@dbToRestore and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=@dbToRestore )
	if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database %s not found.', @dbToRestore, 16, 1) end;

	exec('ALTER DATABASE '+@dbToRestore+' SET SINGLE_USER WITH ROLLBACK IMMEDIATE;');
	exec('RESTORE DATABASE '+@dbToRestore+' FROM  DISK = '''+@physical_device_name+''' WITH  FILE = '+@backupSetId+',  NOUNLOAD,  REPLACE, RECOVERY,  STATS = 5;');
	exec('ALTER DATABASE '+@dbToRestore+' SET MULTI_USER;');
	
END

