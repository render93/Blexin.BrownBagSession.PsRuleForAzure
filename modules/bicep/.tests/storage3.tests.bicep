param location string = resourceGroup().location

module fail_storage_no_hot_access '../storage.bicep' = {
  name: 'storage-deployment-fail-no-hot-access'
  params: {
    location: location 
    storageName: 'stblexin001'
    minimumTlsVersion: 'TLS1_2'
    tags: {
      environment: 'qa'
    }
    accessTier: 'Cool' // fail
  }
}

module pass_storage_hot_access '../storage.bicep' = {
  name: 'storage-deployment-pass-hot-access'
  params: {
    location: location 
    storageName: 'stblexin002'
    minimumTlsVersion: 'TLS1_2'
    tags: {
      environment: 'qa'
    }
    accessTier: 'Hot' // pass
  }
}

module fail_storage_wrong_sku_prod '../storage.bicep' = {
  name: 'storage-deployment-fail-wrong-sku-prod'
  params: {
    location: location 
    storageName: 'stblexin003'
    minimumTlsVersion: 'TLS1_2'
    skuName: 'Standard_GZRS' // fail because sku name is not Standard_RAGRS and tag is prod
    tags: {
      environment: 'prod'
    }
    accessTier: 'Hot'
  }
}

module pass_storage_right_sku_prod '../storage.bicep' = {
  name: 'storage-deployment-pass-right-sku-prod'
  params: {
    location: location 
    storageName: 'stblexin004'
    minimumTlsVersion: 'TLS1_2'
    skuName: 'Standard_RAGZRS' // pass
    tags: {
      environment: 'prod'
    }
    accessTier: 'Hot'
  }
}
