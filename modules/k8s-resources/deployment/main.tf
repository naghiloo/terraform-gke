resource "kubernetes_deployment" "deployment" {
  metadata {
    name = var.name
  }

  spec {
    selector {
      match_labels = {
        app = var.name
      }
    }

    template {
      metadata {
        labels = {
          app = var.name
        }
      }

      spec {
        container {
          name  = var.name
          image = var.image
          port {
            container_port = var.container_port
          }
          resources {
            requests = {
              cpu = var.cpu_request
              memory = var.memory_request
            }
            limits = {
              cpu = var.cpu_limit
              memory = var.memory_limit
            }
          }
        }
      }
    }
  }
}