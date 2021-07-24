path "auth/token/*" { capabilities = ["create", "update", "delete", "read", "list"]}
path "sys/auth" {capabilities = ["create", "update", "delete", "read", "list"]}

path "sys/mounts" { capabilities = ["delete", "list", "read", "create", "update"] }
path "sys/mounts/*" { capabilities = ["delete", "list", "read", "create", "update"] }

path "sys/remount" { capabilities = ["delete", "list", "read", "create", "update"] }
path "sys/remount/*" { capabilities = ["delete", "list", "read", "create", "update"] }

path "sys/mounts/local" { capabilities = ["delete", "list", "read", "create", "update"] }
path "sys/mounts/local/kv" { capabilities = ["delete", "list", "read", "create", "update"] } 
path "sys/policy/local/kv*" {capabilities = ["create", "update", "delete", "read", "list"]}   
path "auth/approle/role/local*" {capabilities = ["create", "update", "delete", "read", "list"]}
path "sys/policies/acl/*" {capabilities = ["create", "update", "delete", "read", "list"]}

path "sys/mounts/local/azure" {capabilities = ["delete", "list", "read", "create", "update"]}
path "sys/mounts/local/azure/*" {capabilities = ["delete", "list", "read", "create", "update"]}

path "local/azure/config" {capabilities = ["delete", "list", "read", "create", "update"]}
path "local/azure/roles/*" {capabilities = ["delete", "list", "read", "create", "update"]}
path "local/azure/creds/*" {capabilities = ["delete", "list", "read", "create", "update"]}