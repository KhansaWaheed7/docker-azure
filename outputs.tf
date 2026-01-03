output "website_url" {
  value = "http://${azurerm_container_group.static_site.fqdn}"
}
