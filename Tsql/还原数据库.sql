--restore filelistonly from disk='F:\¡Ÿ ±\DotNetSoft_backup_2017_01_03_030001_5519747.bak'
restore database DotNetSoft_Dcnc from disk = 'F:\¡Ÿ ±\DotNetSoft_backup_2017_01_03_030001_5519747.bak'
with move 'DotNetSoftTest'     to 'E:\Database\DotNetSoft_Dcnc.mdf'
    ,move 'DotNetSoftTest_log' to 'E:\Database\DotNetSoft_Dcnc_log.ldf'


----	restore filelistonly from disk='E:\Database\TouchMall.bak'
----restore database TouchMall from disk = 'E:\Database\TouchMall.bak'
----with move 'TouchMall'     to 'E:\Database\TouchMall.mdf'
----    ,move 'TouchMall_log' to 'E:\Database\TouchMall_log.ldf'


	restore filelistonly from disk='E:\Database\TouchMall3.bak'
restore database Mall3 from disk = 'E:\Database\TouchMall3.bak'
with move 'TouchMall3'     to 'E:\Database\Mall3.mdf'
    ,move 'TouchMall3_log' to 'E:\Database\Mall3_log.ldf'
