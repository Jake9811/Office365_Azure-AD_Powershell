# Script to connect to Azure Active Directory Domain
# parameters
param ($User,$Password)

# Setup Log in Credentials
$PWord = ConvertTo-SecureString -String $Password -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

# Connecting to Azure
Connect-AzureAD -Credential $Credential