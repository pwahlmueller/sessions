
## Part - 3 - Getting Objects from SQL
## WahlPatr

return 'You should not pass!'

#region Step 1 - Easy Select Statement
SQLServer\Invoke-Sqlcmd -Query 'Select * from Munichdb.dbo.Tabelle1' | ogv
#endregion

#region Step 2 - Another easy but multiline SQL Statement
$cmd = @"
use MunichDB
go

Create VIEW [dbo].[Sicht1]
AS
SELECT TOP (5) Eins, Zwei, Drei, Vier, Fuenf, Sechs
FROM   dbo.Tabelle1
GO
"@

SQLServer\Invoke-Sqlcmd -Query $cmd

SQLServer\Invoke-Sqlcmd -Query 'Select * from Munichdb.dbo.Sicht1' | ogv

SQLServer\Invoke-Sqlcmd -Query 'DROP VIEW [dbo].[Sicht1]' -Database MunichDB

#endregion
$v = Get-DbaDbView -Database MunichDB -SqlInstance localhost -ExcludeSystemView
$v | Export-DbaScript -path C:\tmp\Sicht1.sql
code C:\tmp\Sicht1.sql