###
## Speeddating
##
return 'You should not pass!'

#region Backup

Get-DbaDatabase localhost
Get-DbaDatabase localhost -ExcludeSystem | Backup-DbaDatabase -Path c:\tmp
Measure-DbaBackupThroughput localhost
Get-ChildItem c:\tmp
#endregion

#region Remove DB accidentally
Remove-DbaDatabase -sqlinstance localhost -Database @('MunichDB', 'MunichDB2')
#endregion

#region Restore
Restore-DbaDatabase -SqlInstance localhost -path c:\tmp
#endregion

#region History
Get-DbaDbBackupHistory -sqlinstance localhost | ogv
Get-DbaDbRestoreHistory localhost | Ft
#endregion

#region Jobs
Get-DbaAgentJob localhost

Get-DbaAgentJobStep localhost

Get-DbaAgentJobHistory -SqlInstance localhost
#endregion

#Region Logs
Get-DbaLogin localhost | format-table

Export-DbaLogin -SqlInstance localhost -path C:\tmp

#endregion

#Region DB Prozesse

Get-DbaProcess -SqlInstance localhost | ft

#endregion

#region who is active
Install-DbaWhoIsActive -SqlInstance localhost -Database MunichDB
invoke-dbawhoisactive -sqlinstance localhost -Database MunichDB
#endregion