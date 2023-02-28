
base_tags         = {
  owner_tag       = "Team Test"
  environment_tag = "test"
  product_tag     = "armApp"
  component_tag   = "armApi"
}

resource_group_name   = "go-test-eastus-rg"

server_name           = "gotestserver1"
location              = "eastus"
sku_name              = "B_Standard_B1ms"

storage_mb            = "32768"
backup_retention_days = 7
geo_redundant_backup  = false
auto_grow_enabled     = false
postgresql_version    = "14"

