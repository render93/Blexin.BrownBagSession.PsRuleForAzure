param location string = resourceGroup().location

// test passed because 'Azure.Resource.UseTags' rule is excluded
module pass_storage_without_tag '../storage.bicep' = {
  name: 'storage-deployment-pass-without-tag'
  params: {
    location: location 
    storageName: 'stblexin001'
    minimumTlsVersion: 'TLS1_2'
    tags: {} // no tags but ok
  }
}

module fail_storage_with_bad_tls_version '../storage.bicep' = {
  name: 'storage-deployment-fail-bad-tls_version'
  params: {
    location: location 
    storageName: 'stblexin002'
    minimumTlsVersion: 'TLS1_1'
    tags: {}
  }
}

// test passed because storage stblexin003 is excluded
module pass_storage_with_bad_tls_version '../storage.bicep' = {
  name: 'storage-deployment-pass-bad-tls_version'
  params: {
    location: location 
    storageName: 'stblexin003'
    minimumTlsVersion: 'TLS1_1'
    tags: {}
  }
}
