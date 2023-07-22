Rule 'Org.StorageAccount.AccessTier' -Type 'Microsoft.Storage/storageAccounts' {
  Recommend 'Storage account must have Hot Access Tier mode'

  $hasAccessTier = $Assert.HasField($TargetObject, 'properties.accessTier')
  if (!$hasAccessTier.Result) {
    return $hasAccessTier
  }

  # Require hot tier
  $Assert.HasFieldValue($TargetObject, 'properties.accessTier', 'Hot')
}

Rule 'Org.StorageAccount.RequiredSkuRagzrsIfTagsContainsProd' -Type 'Microsoft.Storage/storageAccounts' {
  Recommend 'Storage account must have RA-GZRS replication if production environment'

  $hasTags = $Assert.HasField($TargetObject, 'tags')
  if (!$hasTags.Result) {
    return $hasTags
  }

  $hasEnvironmentTag = $Assert.HasField($TargetObject.tags, 'environment')
  if (!$hasEnvironmentTag.Result) {
    return $hasEnvironmentTag
  }

  $isProd = $Assert.HasFieldValue($TargetObject.tags, 'environment', 'prod')
  if ($isProd.Result) {
    return $Assert.HasFieldValue($TargetObject, 'sku.name', 'Standard_RAGZRS')
  }

  return $true
}