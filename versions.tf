terraform {
  required_providers {
    azuredevops = {
      source  = "registry.terraform.io/microsoft/azuredevops"
      version = "0.7.0"
    }
  }
  required_version = "~> 1.2.0"
}
