resource "kubernetes_service" "service" {
  metadata {
    name = var.name
  }

  spec {
    type = var.type
    
    selector = {
      app = var.name
    }

    port {
      name = try(var.port_name, var.name)
      port = var.port
      target_port = var.target_port
    }
  }
}