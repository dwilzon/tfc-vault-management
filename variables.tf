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

# added by David
variable "region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}
