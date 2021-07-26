
export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="local"

vault policy write local_poc policies/local.hcl

vault auth enable approle

vault write auth/approle/role/local_rw token_num_uses=0 secret_id_ttl=0 token_policies="local_poc"
