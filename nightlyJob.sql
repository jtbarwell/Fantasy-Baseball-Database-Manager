use Baseball;
GO

declare @pyScript as NVARCHAR(MAX)
set @pyScript = 'print(''Hello SQL'')'
declare @cmd NVARCHAR(MAX)
set @cmd = N'exec sp_execute_external_script @language = ''Python'', @script = ''' + @pyScript + ''''
select @cmd

exec dbo.sp_add_job @job_name = 'Nightly Stats Update';
GO


exec sp_add_jobstep
    @job_name = 'Nightly Stats Update',
    @step_name = 'Call Python to create updateStatements.sql',
    @subsystem = 'TSQL',
    @command = @cmd,
    @retry_attempts = 5,
    @retry_interval = 60;
GO

EXEC dbo.sp_add_schedule
    @schedule_name = N'RunOnce',
    @freq_type = 1,
    @active_start_time = 233000 ;
GO

EXEC sp_attach_schedule
    @job_name = N'Nightly Stats Update',
    @schedule_name = N'RunOnce';
GO

EXEC dbo.sp_add_jobserver @job_name = 'Nightly Stats Update';
GO