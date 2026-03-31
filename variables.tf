variable "datadog_api_key" {
  description = "Datadog API Key"
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Datadog App Key"
  type        = string
  sensitive   = true
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
}

variable "cluster" {
  description = "Kubernetes cluster name"
  type        = string
}

variable "env" {
  description = "Environment (dev/stage/prod)"
  type        = string
}
