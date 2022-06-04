terraform {
  required_providers {
    azuredevops = {
      source  = "registry.terraform.io/microsoft/azuredevops"
      version = "=0.1.8"
    }
  }
  required_version = "~> 1.2.0"
}
