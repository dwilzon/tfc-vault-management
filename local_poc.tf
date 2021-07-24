# After creating the initial policy, let TF manage
resource "vault_policy" "local_poc" {
  name   = "local_poc"
  policy = file("${path.module}/policies/local.hcl")
}