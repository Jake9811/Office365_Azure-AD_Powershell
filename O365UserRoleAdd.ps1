# Script to Add User roles to Accounts
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

# Finally, adding the role
Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId (Get-AzureADUser -ObjectId $userUPN).ObjectID > $null

# Checking if the role got assigned successfully
(Get-AzureADUserMembership -ObjectId $userUPN).DisplayName | Select-String -Pattern $roleName