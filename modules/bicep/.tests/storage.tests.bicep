param location string = resourceGroup().location

module test_storage_best_practices '../storage.bicep' = {
  name: 'storage-deployment'
  params: {
    location: location 
    storageName: 'documents001'
    tags: {
      environment: 'dev'
    }
  }
}
