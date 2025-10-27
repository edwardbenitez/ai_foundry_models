locals {
  rg = {
    name = "${var.rg_prefix}-${random_string.name.result}-rg"
  }
  ai_resource = {
    name                  = "aifoundryres${random_string.name.result}"
    kind                  = "AIServices"
    identity_type         = "SystemAssigned"
    sku_name              = "S0"
    custom_subdomain_name = "aifoundry${random_string.name.result}"
  }
  ai_project = {
    name          = "${var.rg_prefix}-${random_string.name.result}-aip"
    identity_type = "SystemAssigned"
    identity_type = "SystemAssigned"
    sku_name      = "S0"
  }
}