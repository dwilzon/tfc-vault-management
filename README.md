##
# start dev server, this will also enable the ui
vault server -dev -dev-root-token-id="local"

# WARNING! dev mode is enabled! In this mode, Vault runs entirely in-memory
# and starts unsealed with a single unseal key. The root token is already
# authenticated to the CLI, so you can immediately begin using Vault.

# You may need to set the following environment variable:

#     $ export VAULT_ADDR='http://127.0.0.1:8200'

# The unseal key and root token are displayed below in case you want to
# seal/unseal the Vault or re-authenticate.

# Unseal Key: uVqDNMbMMZLA3STt7tNv31Dwm7Q7URNAA6MHA7/OSeM=
# Root Token: local

# Development mode should NOT be used in production installations!

# Let's set the vault environment variables so we can use the vault cli
# note: the values set below are from the ouput after you run the previous
# command.
export VAULT_ADDR=http://127.0.0.1:8200 
export VAULT_TOKEN=local

# create the initial policy, this allows us to modify the system mounts and 
# policy endpoints
vault policy write local_poc policies/local.hcl

# enable approle auth (similate prod)
vault auth enable approle

# create an approle to login
vault write auth/approle/role/local_rw \
    token_num_uses=0 \
    secret_id_ttl=0 \
    token_policies="local_poc"

# set the terraform approle_id variable so that we dont have to set in the tfvars
export TF_VAR_approle_id=$(vault read -field=role_id auth/approle/role/local_rw/role-id)

# set the terraform secret_id variable so that we dont have to set in the tfvars
export TF_VAR_approle_secret_id=$(vault write -f -field=secret_id auth/approle/role/local_rw/secret-id)

# run terraform plan & apply
terraform init
terraform plan
terraform apply

# congrats! you know have a full working local instance of vault managed by terraform