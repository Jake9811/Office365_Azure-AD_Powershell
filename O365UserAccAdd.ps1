# Script to Add a New Account in the Office 365 Domain
# Parameters
param ($DisplayName,$UserPrincipalName,$MailNickName,$Password)

# Adding New User 
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = $Password
New-AzureADUser -DisplayName $DisplayName -UserPrincipalName $UserPrincipalName -UsageLocation "CA" -MailNickName $MailNickName -PasswordProfile $PasswordProfile -AccountEnabled $true

# Checking if the Account was successfully created
Get-AzureADUser -ObjectId $UserPrincipalName