restore filelistonly from disk='D:\Database\TouchMall-2015-12-8.bak'
restore database TouchMall from disk = 'D:\Database\TouchMall-2015-12-8.bak'
with move 'TouchMall'     to 'D:\Database\TouchMall.mdf'
    ,move 'TouchMall_log' to 'D:\Database\TouchMall_log.ldf'

restore filelistonly from disk='D:\Database\Touch10042.bak'
restore database Touch10042 from disk = 'D:\Database\Touch10042.bak'
with move 'TouchBackup'     to 'D:\Database\Touch10042.mdf'
    ,move 'TouchBackup_log' to 'D:\Database\Touch10042_log.ldf'


restore filelistonly from disk='D:\Database\Touch10047.bak'
restore database Touch10047 from disk = 'D:\Database\Touch10047.bak'
with move 'TouchBackup'     to 'D:\Database\Touch10047.mdf'
    ,move 'TouchBackup_log' to 'D:\Database\Touch10047_log.ldf'

restore filelistonly from disk='D:\Database\Touch10054.bak'
restore database Touch10054 from disk = 'D:\Database\Touch10054.bak'
with move 'TouchBackup'     to 'D:\Database\Touch10054.mdf'
    ,move 'TouchBackup_log' to 'D:\Database\Touch10054_log.ldf'

