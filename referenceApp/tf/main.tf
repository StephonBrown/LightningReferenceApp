provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}

terraform {
	backend "azurerm" {
		resource_group_name   = "apptfstate"
    storage_account_name  = "apptfstate31538"
    container_name          = "apptfstate"
    key                        = "mJYySEkR4Q9BvyoLKdZioVlyR9Jic74HZPKJgpkMazH3uhzM/T2YNoW00m79TvWmxgiS4DuqeDIf9d/RsaS/fw=="
	}
}

resource "random_password" "password" {
  length = 16
  special = true
  override_special = "_%@"
}

resource "random_string" "random" {
  length = 16
  special = true
  override_special = "/@£$"
}

resource "random_pet" "server" {
	separator = ""
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
    environment = var.environment
  }
}

data "azurerm_client_config" "current" {
}