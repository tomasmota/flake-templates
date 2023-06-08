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

