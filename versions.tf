terraform {
  required_providers {
    azuredevops = {
      source  = "registry.terraform.io/microsoft/azuredevops"
      version = "=0.2.2"
    }
  }
  required_version = "~> 1.5.0"
}
