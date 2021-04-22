# Script that returns a List of all current user accounts
# parameters
param ($User,$Password)

# Setup Log in Credentials
$PWord = ConvertTo-SecureString -String $Password -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

# Retrive all User Accounts
Get-AzureADUser -All 1 | Select-Object -Property ObjectId,AccountEnabled,DisplayName,Mail,UserPrincipalName