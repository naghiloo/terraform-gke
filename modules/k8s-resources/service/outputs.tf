output "id" {
  value = kubernetes_service.service.id
}

output "port" {
  value = kubernetes_service.service.spec[0].port
}

output "cluster_ip" {
  value = kubernetes_service.service.spec[0].cluster_ip
}