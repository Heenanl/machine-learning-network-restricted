@description('DNS RG name')
param dnsRgName string

var privateDnsZoneName = 'privatelink${environment().suffixes.keyvaultDns}'

resource keyVaultPrivateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' existing = {
  name: privateDnsZoneName
  scope: resourceGroup(dnsRgName)
  //   scope: resourceGroup('sub_id', 'rg-name')
  
}

output keyVaultPrivateDnsZoneId string = keyVaultPrivateDnsZone.id
