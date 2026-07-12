@description('Managed Identity名')
param managedIdentityName string

@description('デプロイ先リージョン')
param location string

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managedIdentityName
  location: location
}

output principalId string = managedIdentity.properties.principalId
output resourceId string = managedIdentity.id
