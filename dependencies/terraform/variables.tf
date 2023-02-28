variable base_tags {
  type        = map(string)
  description = "tags to include on resource"
}

variable "backup_retention_days" {
  type    = string
  default = 7
  description = "no of days the back up will be retained"
}

variable "db_details" {
  type    = list
  default = []
  description = "database needs to be added in postgres server along with it's details "
}

variable "firewall_rule_prefix" {
  type    = string
  default = "firewall-"
}

variable "firewall_rules" {
  type    = list
  default = [
              {
                name = "gotest-postgres-rule"
                start_ip = "0.0.0.0" ,
                end_ip   = "255.255.255.255"
              }
            ]
}

variable "geo_redundant_backup" {
  type    = bool
  default = false
}

variable "auto_grow_enabled" {
  type    = bool
  default = true
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure region in whoch postgresql server will be provisioned"
}

variable "login_password" {
    type        = string
    description = "password for the admin user"
}

variable "login_admin" {
    type        = string
    description = "postgreSql admin username"
}

variable "postgresql_version" {
   type        = string
   default     = "14"
   description = "postgresql version"
}

variable "resource_group_name" {
   type        = string
   description = "name of the resource group in which postgresql server will be provisioned"
}

variable "server_name" {
   type        = string
   description = "postgreSql server instance name"
}

variable "sku_name" {
   type        = string
   description = "sku_name for the postgreSql server"
}

variable "storage_mb" {
   default = 32768
}

variable "ssl_enforcement" {
  default = false
  type    = bool
}

variable "zone" {
  type = string
  default = "1"
}
