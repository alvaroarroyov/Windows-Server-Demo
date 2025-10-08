# Import Active Directory module
Import-Module ActiveDirectory

# User parameters
$Username = "TestUser1"
$Password = ConvertTo-SecureString "Arr@yo123!" -AsPlainText -Force
$FullName = "Test User One"
$OU = "OU=Employees,DC=alvaroarroyocompany,DC=com" 

# Create user in AD
New-ADUser -Name $Username -AccountPassword $Password -Enabled $true -Path $OU -DisplayName $FullName -SamAccountName $Username

Write-Output "User $Username successfully created in OU=Employees."