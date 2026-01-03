resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_container_group" "static_site" {
  name                = "tfstaticwebsitestg-aci"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  ip_address_type     = "public"
  dns_name_label      = "tfstaticwebsitestg-${random_id.suffix.hex}"  # must be unique

  container {
    name   = "nginx"
    image  = "ghcr.io/<GitHubUsername>/tfstaticwebsitestg:latest"
    cpu    = "0.5"
    memory = "0.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

output "website_url" {
  value = "http://${azurerm_container_group.static_site.fqdn}"
}
