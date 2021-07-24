export TF_VAR_approle_id=$(vault read -field=role_id auth/approle/role/local_rw/role-id)
export TF_VAR_approle_secret_id=$(vault write -f -field=secret_id auth/approle/role/local_rw/secret-id)

# run terraform plan & apply
#terraform init
#terraform plan
#terraform apply

# congrats! you know have a full working local instance of vault managed by terraform
