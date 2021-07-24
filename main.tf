provider "vault" {
  # Address can be set as env var VAULT_ADDR for local use, but doesn't work in the pipeline for some reason.
  # I think it's because we're running validate and that runs in the build agent vs in the workspace.
  # That means it would need to be set in the env for the build step.
  # address = "http://127.0.0.1:8200"
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.approle_id
      secret_id = var.approle_secret_id
    }
  }
}

data "vault_auth_backend" "approle" {
  path = "approle"
}
