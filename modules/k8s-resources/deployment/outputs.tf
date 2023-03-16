output "name" {
  value = kubernetes_deployment.deployment.metadata[0].name
}