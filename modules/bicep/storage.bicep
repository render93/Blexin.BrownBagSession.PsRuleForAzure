param location string
param tags object
param storageName string
@allowed(['TLS1_0','TLS1_1','TLS1_2','TLS1_3'])
param minimumTlsVersion string
@allowed(['Hot','Cool','Premium'])
param accessTier string = 'Hot'
@allowed(['Premium_LRS', 'Premium_ZRS' , 'Standard_GRS' , 'Standard_GZRS' , 'Standard_LRS' , 'Standard_RAGRS' , 'Standard_RAGZRS' , 'Standard_ZRS'])
param skuName string = 'Standard_GRS'

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  tags: tags
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: minimumTlsVersion
    allowBlobPublicAccess: false
    accessTier: accessTier
    networkAcls: {
      defaultAction: 'Deny'
    }
  }
}

resource blobServices 'Microsoft.Storage/storageAccounts/blobServices@2021-04-01' = {
  name: 'default'
  parent: storage
  properties: {
    deleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}
