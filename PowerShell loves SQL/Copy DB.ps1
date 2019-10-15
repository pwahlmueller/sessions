##
## Kopiere Datenbank
## WahlPatr

# show first in SQL Server Mgmt

# Step 1 - Stop Processes
Get-DbaProcess -SqlInstance scsmdev -Database StagingAssetDB | Stop-DbaProcess

# Step 2- Migrate db
Copy-DbaDatabase -Source scsmdev -Destination scorch02 -Database StagingAssetDB -BackupRestore -SharedPath '\\sv445\PSConfFileShare\'

# Step 3 - Copy User Logins

Copy-DbaLogin -Source scsmdev -Destination scorch02 -Login AppReadOnly, AppReadWrite, DOMAIN\AppUser

## Have a look

# step 4 - Set DB Offline

Set-DbaDbState -SqlInstance scorch02 -Database StagingAssetDB -Offline -Force

Remove-DbaDatabase -Database StagingAssetDB -SqlInstance scorch02 find-dbacommand


