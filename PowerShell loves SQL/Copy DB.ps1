##
## Kopiere Datenbank
## WahlPatr

# show first in SQL Server Mgmt

# Step 1 - Stop Processes
Get-DbaProcess -SqlInstance sql1 -Database db1 | Stop-DbaProcess

# Step 2- Migrate db
Copy-DbaDatabase -Source sql1 -Destination sql2 -Database db1 -BackupRestore -SharedPath c:\

# Step 3 - Copy User Logins

Copy-DbaLogin -Source sql1 -Destination sql2 -Login AppReadOnly, AppReadWrite, DOMAIN\AppUser

## Have a look

# step 4 - Set DB Offline

Set-DbaDbState -SqlInstance sql2 -Database db1 -Offline -Force

Remove-DbaDatabase -Database db1 -SqlInstance sql2


