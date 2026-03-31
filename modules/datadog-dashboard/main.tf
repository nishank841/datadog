terraform {
  required_providers {
    datadog = {
      source = "datadog/datadog"
    }
  }
}

locals {
  dashboard_title = "${var.app_name} - ${var.env} Kubernetes Dashboard"
}
