resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.display_name

  disabled = var.disabled
  project = var.project
}