param location string = resourceGroup().location

// test passed
module pass_storage_best_practices '../storage.bicep' = {
  name: 'storage-deployment-pass'
  params: {
    location: location 
    storageName: 'stblexin001'
    minimumTlsVersion: 'TLS1_2'
    tags: {
      environment: 'qa'
    }
  }
}

// test failed because of no tags specified
module fail_storage_best_practices '../storage.bicep' = {
  name: 'storage-deployment-fail'
  params: {
    location: location 
    storageName: 'stblexin002'
    minimumTlsVersion: 'TLS1_2'
    tags: {} // fail
  }
}
