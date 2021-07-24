##########################################################
# Vault mount for the cloudauto generic kv2 secret store #
##########################################################
resource "vault_mount" "local_kv2" {
  path        = "local/test"
  type        = "kv-v2"
  description = "Secrets engine for Cloud Automation team"
}

##########################################################
# Vault mount/backend for the cloudauto Azure secrets     #
##########################################################
# resource "vault_azure_secret_backend" "local_azure" {
#   path            = "local/azure"
#   subscription_id = var.spn_core_clam_spnautomation_subscription_id
#   tenant_id       = var.spn_core_clam_spnautomation_tenant_id
#   client_id       = var.spn_core_clam_spnautomation_client_id
#   client_secret   = var.spn_core_clam_spnautomation_client_secret
# }