# Import Active Directory module
Import-Module ActiveDirectory

# Now we define paths and OU
$CSVPath = "C:\Users\AlvaroArroyo\Desktop\scripts\CreateUsers.csv"
$OU = "OU=Employees,DC=alvaroarroyocompany,DC=com"

# Read CSV and create users
Import-Csv $CSVPath | ForEach-Object {
    $Username = $_.Username
    $Password = ConvertTo-SecureString $_.Password -AsPlainText -Force
    $FullName = $_.FullName

    New-ADUser -Name $Username -AccountPassword $Password -Enabled $true -Path $OU -DisplayName $FullName -SamAccountName $Username
}

Write-Output "Users created from CSV in OU=Employees."