variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-062f7200baf2fa504"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "./keys/mypubkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "./keys/mypubkey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
