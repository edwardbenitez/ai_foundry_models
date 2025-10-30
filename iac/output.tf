output "model_name" {
    description = "Model name"
  value = azurerm_cognitive_deployment.gpt5_mini.name
}
output "endpoint" {
    description = "AI foundry endpoint"
  value = azurerm_cognitive_account.ai_foundry.endpoint
}