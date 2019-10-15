#region Step 7 - removing db
Remove-DbaDatabase -Database MunichDB -SqlInstance localhost -Confirm:$false
Remove-DbaDatabase -Database MunichDB2 -SqlInstance localhost -Confirm:$false
#endregion