resource "google_project_iam_binding" "role_binding" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.value
  members = [
    "serviceAccount:${var.service_account}"
  ]
}