param location string = resourceGroup().location

// test passed
module ok_storage_best_practices '../storage.bicep' = {
  name: 'storage-deployment-ok'
  params: {
    location: location 
    storageName: 'stblexin001'
    minimumTlsVersion: 'TLS1_2'
    tags: {
      environment: 'qa'
    }
  }
}

// test failed because of minimumTlsVersion
module fail_storage_best_practices '../storage.bicep' = {
  name: 'storage-deployment-fail'
  params: {
    location: location 
    storageName: 'stblexin002'
    minimumTlsVersion: 'TLS1_1' // fail
    tags: {
      environment: 'dev'
    }
  }
}

// test passed only with ps-rul-dev.yaml option file
module ok_storage_without_tag '../storage.bicep' = {
  name: 'storage-deployment-ok-without-tag'
  params: {
    location: location 
    storageName: 'stblexin003'
    minimumTlsVersion: 'TLS1_2'
    tags: {} // no tags but ok
  }
}

// test failed because of accessTier
module fail_storage_no_hot_access '../storage.bicep' = {
  name: 'storage-deployment-fail-no-hot-access'
  params: {
    location: location 
    storageName: 'stblexin004'
    minimumTlsVersion: 'TLS1_2'
    tags: {
      environment: 'qa'
    }
    accessTier: 'Cool' // fail
  }
}
