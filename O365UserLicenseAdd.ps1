# Script to Add License to the New Accounts
# Parameters
param ($userUPN,$planName)

# Defining License 
$License = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$License.SkuId = (Get-AzureADSubscribedSku | Where-Object -Property SkuPartNumber -Value $planName -EQ).SkuID
$LicensesToAssign = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$LicensesToAssign.AddLicenses = $License

# Adding License to the User
Set-AzureADUserLicense -ObjectId $userUPN -AssignedLicenses $LicensesToAssign

# Confirming if the License was successfully added
Get-AzureADUserLicenseDetail -ObjectId $userUPN
