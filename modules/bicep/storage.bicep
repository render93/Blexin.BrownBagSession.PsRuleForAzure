param location string
param tags object
param storageName string
@allowed(['TLS1_0','TLS1_1','TLS1_2','TLS1_3'])
param minimumTlsVersion string

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'blob${storageName}'
  tags: union(tags, {
    classification: 'general'
  })
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: minimumTlsVersion
    allowBlobPublicAccess: false
    accessTier: 'Hot'
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
