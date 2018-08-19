$login = "user1"
$password = -join ((48..57) + (97..122) | Get-Random -Count 8 | % {[char]$_})
$sqlserver = "sql-server-name"

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
[System.Reflection.Assembly]::LoadWithPartialName(" Microsoft.SqlServer.Management.Smo.Login")
$login = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Login -ArgumentList $sqlserver, $login
$login.LoginType = "SqlLogin"
$login.PasswordExpirationEnabled = $false
$login.PasswordPolicyEnforced = $false
$login.Create($password)
$login.AddToRole("dbcreator")
