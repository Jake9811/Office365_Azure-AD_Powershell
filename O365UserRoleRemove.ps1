# Script to Remove User roles from Accounts
# Parameters
param ($userUPN,$roleName)

# Getting the role object from Azure
$role = Get-AzureADDirectoryRole | Where {$_.displayName -eq $roleName}

# If not found, making a new one from Template
if ($role -eq $null) {
$roleTemplate = Get-AzureADDirectoryRoleTemplate | Where {$_.displayName -eq $roleName}
Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId
$role = Get-AzureADDirectoryRole | Where {$_.displayName -eq $roleName}
}

# Finally, removing the role
Remove-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -MemberId (Get-AzureADUser -ObjectId $userUPN).ObjectID

# Checking if the role got removed successfully
if ( (Get-AzureADUserMembership -ObjectId $userUPN).DisplayName | Select-String -Pattern $roleName -NotMatch ) {
    return "Role Deleted!"
}
