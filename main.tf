terraform {
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = "~> 3.0"  # or latest stable
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key

  api_url = "https://api.us5.datadoghq.com/"
}

module "datadog_dashboard" {
  source = "./modules/datadog-dashboard"

  app_name  = var.app_name
  namespace = var.namespace
  cluster   = var.cluster
  env       = var.env
}
