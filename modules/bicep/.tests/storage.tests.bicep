param location string = resourceGroup().location

module ok_storage_best_practices '../storage.bicep' = {
  name: 'storage-deployment-ok'
  params: {
    location: location 
    storageName: 'documents001'
    minimumTlsVersion: 'TLS1_2'
    tags: {
      environment: 'qa'
    }
  }
}

// module fail_storage_best_practices '../storage.bicep' = {
//   name: 'storage-deployment-fail'
//   params: {
//     location: location 
//     storageName: 'documents001'
//     minimumTlsVersion: 'TLS1_1'
//     tags: {
//       environment: 'dev'
//     }
//   }
// }

module ok_storage_without_tag '../storage.bicep' = {
  name: 'storage-deployment-ok-without-tag'
  params: {
    location: location 
    storageName: 'documents001'
    minimumTlsVersion: 'TLS1_2'
    // tags: {
    //   environment: 'dev'
    // }
  }
}
