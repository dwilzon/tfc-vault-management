##
#vault server -dev -dev-root-token-id="local"

export VAULT_ADDR=http://127.0.0.1:8200 
export VAULT_TOKEN=local

vault policy write local_poc policies/local.hcl
vault auth enable approle
vault write auth/approle/role/local_rw token_num_uses=0 secret_id_ttl=0 token_policies="local_poc"

export TF_VAR_approle_id=$(vault read -field=role_id auth/approle/role/local_rw/role-id)
export TF_VAR_approle_secret_id=$(vault write -f -field=secret_id auth/approle/role/local_rw/secret-id)

# run terraform plan & apply
#terraform init
#terraform plan
#terraform apply

# congrats! you know have a full working local instance of vault managed by terraform
