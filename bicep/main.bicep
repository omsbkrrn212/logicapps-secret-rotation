@description('Azureリージョン')
param location string = resourceGroup().location

@description('ストレージアカウント名')
param storageAccountName string

@description('Key Vault名')
param keyVaultName string

@description('Managed Identity名')
param managedIdentityName string

// Storage
module storage './modules/storage.bicep' = {
  name: 'storageDeployment'
  params: {
    storageAccountName: storageAccountName
    location: location
  }
}

// KeyVault
module keyVault './modules/keyvault.bicep' = {
  name: 'keyVaultDeployment'
  params: {
    keyVaultName: keyVaultName
    location: location
  }
}

module managedIdentity './modules/managedIdentity.bicep' = {
  name: 'managedIdentityDeployment'
  params: {
    managedIdentityName: managedIdentityName
    location: location
  }
}

output storageAccountId string = storage.outputs.storageAccountId
