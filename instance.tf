provider "aws" {
  shared_credentials_file = "C://Users//pallab.panda//.aws//credentials"
  profile                 = "ivanti"
  region                  = "us-east-1"
}

resource "aws_instance" "TerraformExer" {
  ami           = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"

}
output "outputjson" {
  value = "${aws_instance.TerraformExer}"
}

