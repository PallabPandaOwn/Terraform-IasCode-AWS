provider "aws" {
  shared_credentials_file = "C://Users//pallab.panda//.aws//credentials"
  profile                 = ""
  region                  = "us-east-1"
}

resource "aws_instance" "TerraformExer" {
  name          = "Instance-1"
  ami           = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  
}
