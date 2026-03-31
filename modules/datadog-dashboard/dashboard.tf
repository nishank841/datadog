resource "datadog_dashboard" "k8s_dashboard" {
  title       = local.dashboard_title
  layout_type = "ordered"

  #########################################
  # 🔹 CPU Usage per Pod
  #########################################
  widget {
    timeseries_definition {
      title = "Pod CPU Usage"

      request {
        q = "avg:kubernetes.cpu.usage.total{kube_cluster_name:${var.cluster},kube_namespace:${var.namespace}} by {pod}"
        display_type = "line"
      }
    }
  }

  #########################################
  # 🔹 Memory Usage per Pod
  #########################################
  widget {
    timeseries_definition {
      title = "Pod Memory Usage"

      request {
        q = "avg:kubernetes.memory.usage{kube_cluster_name:${var.cluster},kube_namespace:${var.namespace}} by {pod}"
        display_type = "line"
      }
    }
  }

  #########################################
  # 🔹 CPU Usage vs Limits
  #########################################
  widget {
    timeseries_definition {
      title = "CPU Usage vs Limits"

      request {
        q = "avg:kubernetes.cpu.usage.total{kube_cluster_name:${var.cluster},kube_namespace:${var.namespace}} by {pod}"
        display_type = "line"
      }

      request {
        q = "avg:kubernetes.cpu.limits{kube_cluster_name:${var.cluster},kube_namespace:${var.namespace}} by {pod}"
        display_type = "line"
      }
    }
  }

  #########################################
  # 🔹 Memory Usage vs Limits
  #########################################
  widget {
    timeseries_definition {
      title = "Memory Usage vs Limits"

      request {
        q = "avg:kubernetes.memory.usage{kube_cluster_name:${var.cluster},kube_namespace:${var.namespace}} by {pod}"
        display_type = "line"
      }

      request {
        q = "avg:kubernetes.memory.limits{kube_cluster_name:${var.cluster},kube_namespace:${var.namespace}} by {pod}"
        display_type = "line"
      }
    }
  }

  #########################################
  # 🔹 Pod Restarts
  #########################################
  widget {
    timeseries_definition {
      title = "Pod Restarts"

      request {
        q = "sum:kubernetes.containers.restarts{kube_cluster_name:${var.cluster},kube_namespace:${var.namespace}} by {pod}"
        display_type = "bars"
      }
    }
  }

  #########################################
  # 🔹 Namespace Filter
  #########################################
  template_variable {
    name    = "namespace"
    prefix  = "kube_namespace"
    default = var.namespace
  }
}
