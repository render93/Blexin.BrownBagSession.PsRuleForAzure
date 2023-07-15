param location string = resourceGroup().location

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

module ok_storage_without_tag '../storage.bicep' = {
  name: 'storage-deployment-ok-without-tag'
  params: {
    location: location 
    storageName: 'stblexin003'
    minimumTlsVersion: 'TLS1_2'
    tags: {} // no tags but ok
  }
}

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
