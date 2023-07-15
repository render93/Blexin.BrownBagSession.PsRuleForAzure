# Synopsis: Storage account must have Hot Access
Rule 'Org.StorageAccount.AccessTier' -Type 'Microsoft.Storage/storageAccounts' {
  Recommend 'Storage account must have Hot Access'

  $hasAccessTier = $Assert.HasField($TargetObject, 'properties.accessTier')
  if (!$hasAccessTier.Result) {
    return $hasAccessTier
  }

  # Require hot tier
  $Assert.HasFieldValue($TargetObject, 'properties.accessTier', 'Hot')
}