@description('Azureリージョン')
param location string = resourceGroup().location

@description('ストレージアカウント名')
param storageAccountName string

module storage './modules/storage.bicep' = {
  name: 'storageDeployment'
  params: {
    storageAccountName: storageAccountName
    location: location
  }
}

output storageAccountId string = storage.outputs.storageAccountId
