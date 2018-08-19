

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
[System.Reflection.Assembly]::LoadWithPartialName(" Microsoft.SqlServer.Management.Smo.Login")
$login = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Login -ArgumentList $sqlserver, $cn
$login.LoginType = "SqlLogin"
$login.PasswordExpirationEnabled = $false
$login.PasswordPolicyEnforced = $false
$login.Create($password)
$login.AddToRole("dbcreator")
