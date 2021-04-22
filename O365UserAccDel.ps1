# Script to Delete Accounts from Office Domain
# Parameters
param ($UserPrincipalName)

# Deleting User Account
Remove-AzureADUser -ObjectID $UserPrincipalName

# Checking if the account was successfully deleted
try {
    Get-AzureADUser -ObjectId $UserPrincipalName
}
catch {
    return "Account Deleted!"
}