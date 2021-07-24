provider "vault" {
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

# Added by David Wilson

provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
~    
