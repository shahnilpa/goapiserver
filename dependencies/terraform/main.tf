
resource "azurerm_resource_group" "postgresqlRg" {
    name     =  var.resource_group_name
    location =  var.location
}

resource "azurerm_postgresql_flexible_server" "instance" {
  name                          = var.server_name
  location                      = var.location
  resource_group_name           = azurerm_resource_group.postgresqlRg.name
  sku_name                      = var.sku_name  
 
  storage_mb                    = var.storage_mb
  backup_retention_days         = var.backup_retention_days
  geo_redundant_backup_enabled  = var.geo_redundant_backup
 
  administrator_login           = var.login_admin
  administrator_password        = var.login_password
  version                       = var.postgresql_version
  zone                          = var.zone 
  tags                          = var.base_tags
  depends_on                    = [azurerm_resource_group.postgresqlRg]
}


resource "azurerm_postgresql_flexible_server_database" "database" {
  count                   = length(var.db_details)
  name                    = lookup(var.db_details[count.index], "db_name", count.index)
  server_id               = azurerm_postgresql_flexible_server.instance.id
  charset                 = lookup(var.db_details[count.index], "db_charset", count.index)
  collation               = lookup(var.db_details[count.index],"db_collation", count.index)
  depends_on              = [azurerm_postgresql_flexible_server_firewall_rule.firewall_rules]
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "firewall_rules" {
  count                   = length(var.firewall_rules)
  name                    = join("",[var.firewall_rule_prefix,lookup(var.firewall_rules[count.index], "name", count.index)])
  server_id               = azurerm_postgresql_flexible_server.instance.id
  start_ip_address        = lookup(var.firewall_rules[count.index], "start_ip", count.index)
  end_ip_address          = lookup(var.firewall_rules[count.index], "end_ip", count.index)

}