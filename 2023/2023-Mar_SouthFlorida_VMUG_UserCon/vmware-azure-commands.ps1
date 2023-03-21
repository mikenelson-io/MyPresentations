## Azure commands to create a service principal, register providers, and verify the feature is registered.
# Create the service principal
$sp = New-AzADServicePrincipal -DisplayName "azvmwarearcsp" -Role 'Contributor'

# Retrieve the SP information
get-azadservicePrincipal -DisplayName "azvmwarearcsp"
DisplayName   Id                                   AppId
-----------   --                                   -----
azvmwarearcsp b8263c38-05f9-41e3-b141-eb1650bb28ed cf3513a9-cbdd-45b6-8b30-b5e386c76c99

# Extract the SP secret
$spSecret = (Get-AzADServicePrincipalCredential -ObjectId $sp.ObjectId).Value
$spSecret

# Register the providers
az provider register --namespace Microsoft.ConnectedVMwarevSphere
az provider register --namespace Microsoft.ExtendedLocation
az provider register --namespace Microsoft.KubernetesConfiguration
az provider register --namespace Microsoft.ResourceConnector
az provider register --namespace Microsoft.AVS

# Verify the providers are registered
az provider show -n Microsoft.ConnectedVMwarevSphere
az provider show -n Microsoft.ExtendedLocation
az provider show -n Microsoft.KubernetesConfiguration
az provider show -n Microsoft.ResourceConnector
az provider show -n Microsoft.AVS

# Verify the feature is registered. This can take awhile & you cannot proceed until this says "registered".
az feature show --name AzureArcForAVS --namespace Microsoft.AVS

## VMware commands to create the Resource Pool in vCenter
# Connect to vCenter
Connect-VIServer -Server vcenter.ale.local -User "administrator@vsphere.local"
# Create the Resource Pool
New-ResourcePool -Name "azvmwarearc" -Parent "cluster1" -MemReservationGB "16"
# Create the folder
New-Folder -Name "azvmwarearc" -Parent "cluster1"
# Disconnect from vCenter
Disconnect-VIServer -Server vcenter.ale.local -Confirm:$false
