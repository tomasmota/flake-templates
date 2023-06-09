terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.39.0"
    }
  }
}

# Configure the Azure Active Directory Provider by defining these environment variables
provider "azuread" {
  # client_id     = $ARM_CLIENT_ID
  # client_secret = $ARM_CLIENT_SECRET
  # tenant_id     = $ARM_TENANT_ID
}

data "azuread_client_config" "current" {}

resource "azuread_group" "this" {
  display_name = "flake_template_group"
  description  = "This group was created from a flake template"

  owners           = [data.azuread_client_config.current]
  security_enabled = true
}

output "group" {
  value = azuread_group.this.id
}
