output "cluster_name" {
  value = module.gke_cluster.name
  description = "Kubernetes cluster name"
}