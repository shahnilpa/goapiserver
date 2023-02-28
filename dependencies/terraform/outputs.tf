output "database_ids" {
  description = "The list of all database resource ids"
  value       = azurerm_postgresql_flexible_server_database.database.*.id
}

output "firewall_rule_ids" {
  description = "The list of all firewall rule resource ids"
  value       = azurerm_postgresql_flexible_server_firewall_rule.firewall_rules.*.id
}

output "server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.instance.fqdn
}

output "server_name" {
  description = "The name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.instance.name
}

output "server_id" {
  description = "The resource id of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.instance.id
}
