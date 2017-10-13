DECLARE @DatabaseName NVARCHAR(50);
SET @DatabaseName = 'DotNetSoft_Dcnc';

--检查是否启用CDC
SELECT  is_cdc_enabled ,
        CASE WHEN is_cdc_enabled = 0 THEN 'CDC功能禁用'
             ELSE 'CDC功能启用'
        END 备注
FROM    sys.databases
WHERE   name = @DatabaseName;


USE DotNetSoft_Dcnc;
GO

----启用CDC
--EXECUTE sys.sp_cdc_enable_db

GO

--表开启变更捕获
EXEC sys.sp_cdc_enable_table @source_schema = 'dbo',
    @source_name = 'Base_Corporation', @role_name = NULL;
GO
--检查表CDC功能启用
SELECT name,is_tracked_by_cdc,CASE WHEN is_tracked_by_cdc = 0 THEN 'CDC功能禁用' ELSE 'CDC功能启用' END 描述 FROM sys.tables
WHERE OBJECT_ID IN(OBJECT_ID('dbo.Base_Corporation'),OBJECT_ID('dbo.Base_Employee'))



--显示原有配置：
EXEC sp_cdc_help_jobs
GO
--更改数据保留时间为分钟
EXECUTE sys.sp_cdc_change_job @job_type = N'cleanup',@retention=100
GO
--停用作业
EXEC sys.sp_cdc_stop_job N'cleanup'
GO
--启用作业
EXEC sys.sp_cdc_start_job N'cleanup'
GO
--再次查看
EXEC sp_cdc_help_jobs
GO



----获取当前所有可用更改
----DECLARE @from_lsn binary(10), @to_lsn binary(10)
----SET @from_lsn =
----   sys.fn_cdc_get_min_lsn('dbo_Base_Corporation')
----SET @to_lsn   = sys.fn_cdc_get_max_lsn()
----SELECT * FROM cdc.fn_cdc_get_all_changes_dbo_Base_Corporation
----  (@from_lsn, @to_lsn, N'all update old');
----GO


----查询变更时间
--SELECT  [__$operation] ,
--       CASE [__$operation] WHEN 1 THEN '删除' WHEN 2 THEN '插入' WHEN 3 THEN '更新（更新前）'
--       WHEN 4 THEN '更新（更新后）' END [类型],
--        sys.fn_cdc_map_lsn_to_time([__$start_lsn]) [更改时间] ,
--       [CorpID], [CorpType]
--           ,[CorpCode]
--           ,[ShortName]
--           ,[CorpName]
--           ,[ProvinceID]
--           ,[CityID]
--           ,[RegionID]
--           ,[Address]
--           ,[PostCode]
--           ,[Phone]
--           ,[Mobile]
--           ,[Fax]
--           ,[Email]
--           ,[Boss]
--           ,[LinkMan]
--           ,[NormalPriceIdentifyCode]
--           ,[RepairPriceIdentifyCode]
--           ,[AppendPriceIdentifyCode]
--           ,[Description]
--           ,[IsStopped]
--           ,[IsDeleted]
--           ,[CreateTime]
--           ,[CreateUserId]
--           ,[CreateUserName]
--           ,[ModifyTime]
--           ,[ModifyUserId]
--           ,[ModifyUserName]
--FROM    cdc.dbo_Base_Corporation_CT


----检查时间段内数据变更
--DECLARE @StartLSN VARBINARY(10)=sys.fn_cdc_map_time_to_lsn('smallest greater than or equal','2017-4-17 11:26:06')
--DECLARE @EndLSN VARBINARY(10)=sys.fn_cdc_map_time_to_lsn('largest less than or equal','2017-4-17 12:26:26')
--SELECT *
--FROM cdc.dbo_Base_Corporation_CT WHERE  [__$start_lsn] BETWEEN @StartLSN AND @EndLSN--[__$operation]=2 AND


--获取最后变更时间
SELECT sys.fn_cdc_get_max_lsn() [数据库级别的最大LSN],
 sys.fn_cdc_map_lsn_to_time( sys.fn_cdc_get_min_lsn('[cdc].[dbo_Base_Corporation_CT]')) [捕获实例的lsn]

 SELECT sys.fn_cdc_get_min_lsn('[cdc].[dbo_Base_Corporation_CT]')
 --获取数据表最后变更时间
 SELECT sys.fn_cdc_map_lsn_to_time( MAX(__$start_lsn)) FROM [cdc].[dbo_Base_Corporation_CT]