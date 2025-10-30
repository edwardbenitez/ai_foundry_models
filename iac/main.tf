## Create a random string to make resource names unique
## 
resource "random_string" "name" {
  length      = 5
  min_numeric = 5
  numeric     = true
  special     = false
  lower       = true
  upper       = false
}

## Retrieve information about the current Azure client configuration
##
data "azurerm_client_config" "current" {}

## Create a resource group for the resources to be stored in
##
resource "azurerm_resource_group" "rg" {
  name     = local.rg.name
  location = var.location
}

## Create an AI Foundry resource
## It will also create a default project within the Foundry
##
resource "azurerm_cognitive_account" "ai_foundry" {
  name                = local.ai_resource.name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = local.ai_resource.kind

  identity {
    type = local.ai_resource.identity_type
  }

  sku_name = local.ai_resource.sku_name

  # required for stateful development in Foundry including agent service
  custom_subdomain_name      = local.ai_resource.custom_subdomain_name
  project_management_enabled = true
  tags = {
    Acceptance = "Test_Project"
  }
}

## Create a deployment for OpenAI's GPT-4o in the AI Foundry resource
##
resource "azurerm_cognitive_deployment" "gpt5_mini" {
  depends_on = [
    azurerm_cognitive_account.ai_foundry
  ]
  name                 = "gpt-5-nano"
  cognitive_account_id = azurerm_cognitive_account.ai_foundry.id

  sku {
    name     = "GlobalStandard"
    capacity = 100
  }

  model {
    format  = "OpenAI"
    name    = "gpt-5-nano"
    version = "2025-08-07"
  }
}

#add permissions at deployment level
resource "azurerm_role_assignment" "rbac-ai-user" {
  scope                = azurerm_cognitive_deployment.gpt5_mini.id
  role_definition_name = "Azure AI User"
  principal_id         = data.azurerm_client_config.current.object_id
}