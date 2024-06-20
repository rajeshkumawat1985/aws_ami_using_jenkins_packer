packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "region" {
  type    = string
  default = ""
}

variable "ami_name" {
  type    = string
  default = ""
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "ssh-username" {
  type    = string
  default = "ec2-user"
}

variable "description" {
  type    = string
  default = ""
}

variable "subnet-id" {
  type    = string
  default = "subnet-23fccb6b"
}

variable "security-group-id" {
  type    = string
  default = "sg-0e5d8ca32bca5d2b7"
}

source "amazon-ebs" "example" {
  region     = var.region
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"
    }
    owners      = ["amazon"]
    most_recent = true
  }
  ami_name        = var.ami_name
  instance_type   = var.instance-type
  ssh_username    = var.ssh-username
  ami_description = var.description
  subnet_id       = var.subnet-id
  security_group_id = var.security-group-id

  launch_block_device_mappings {
    device_name           = "/dev/xvda"
    volume_size           = 8
    delete_on_termination = true
    volume_type           = "gp3"
  }

  tags = {
    "Name"    = "VIJAY-PACKER"
    "purpose" = "packer"
  }
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "shell" {
    script          = "./userdata.sh"
    execute_command = "{{ .Vars }} sudo -E sh '{{ .Path }}'"
  }
}
