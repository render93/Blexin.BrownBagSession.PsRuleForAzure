param location string = 'westeurope'

resource routeTable 'Microsoft.Network/routeTables@2019-11-01' = {
  name: 'route-table'
  // name: 'route-table!'
  location: location
  properties: {
    routes: []
    disableBgpRoutePropagation: true
  }
  tags: {
    scope: 'psruledemo'
  }
}
