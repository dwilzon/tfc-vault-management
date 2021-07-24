variable "approle_id" {
  description = "The AppRole ID used to manage Vault resources in this repo"
  type        = string
  sensitive   = true
}

variable "approle_secret_id" {
  description = "The AppRole ID secret used to manage Vault resources in this repo"
  type        = string
  sensitive   = true
}