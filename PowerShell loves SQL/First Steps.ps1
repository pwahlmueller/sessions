###
## PowerShell für SQL DBAs
##
return 'You should not pass!'
#region Step 1 - Find Module

[system.Diagnostics.Process]::Start("firefox", "https://www.powershellgallery.com/packages?q=sql")

#endregion  Step 1 - Find Module

#region Step 2 - Get the Module
Install-Module -Name Write-ObjectToSQL -Force
Install-Module -Name dbatools -Force
Install-Module -Name sqlserver -force -AllowClobber

(get-command -module dbatools).count
(get-command -Module Write-ObjectToSQL).count
(get-command -module sqlserver).count
(get-command -Module SQLPS).count

Import-Module Write-ObjectToSQL
import-module dbatools -force
Import-Module sqlserver
#endregion Step 2

#region Step 3 - Find DBA Commands
find-dbacommand -tag Database
Find-DbaCommand -Tag Backup
Find-DbaCommand -tag Restore
Find-dbaCommand -tag Migration
find-dbacommand -tag agent
Find-DbaCommand -tag user
find-dbacommand -tag linked

Find-DbaCommand -tag agent | Out-GridView -PassThru | Get-Help -Full

(find-dbacommand ).tags | group | sort count | ogv

#Welche Tags gibt es?
find-dbacommand -tag linked

#region Wie kommt man in PS zu Infos?
(find-dbacommand).tags | group | sort count -Descending | ogv
#endregion

#endregion

#region Step 4 - dbatools - import csv
get-help New-DbaDatabase
New-DbaDatabase -Name MunichDB -SqlInstance localhost
New-DbaDatabase -Name MunichDB2 -SqlInstance localhost

$Data = Import-Csv 'C:\temp\Tabelle.csv' -Delimiter ','
$Data | Write-DbaDataTable -SqlInstance localhost -Table munichdb.dbo.Tabelle1 -AutoCreateTable
#endregion

#region Step 5 - Write-ObjectToSQL
$Data = Import-csv 'C:\Temp\Tabelle.csv'  -Delimiter ',' # -encoding default # (evtl. notwendig)
$Data | Write-ObjectToSQL -server localhost -Database Munichdb -TableName Tabelle2
#endregion

code '.\First Steps.sql'

## Step 6- dbatools - import an Object (eg dir)
$Data = Get-ChildItem C:\Programme\windowsPowershell -Recurse   # aka dir
$Data | Write-DbaDataTable -SqlInstance localhost -Table munichdb.dbo.dir -AutoCreateTable
#endregion

[system.Diagnostics.Process]::Start("chrome", "https://dbatools.io/")
