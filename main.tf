provider "vault" {
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id  = var.approle_id
      secret_id = var.approle_secret_id
    }
  }
}

data "vault_auth_backend" "approle" {
  path = "approle"
}