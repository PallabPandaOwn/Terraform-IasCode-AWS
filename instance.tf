#AWS provider
provider "aws" {
  shared_credentials_file = "C://Users//pallab.panda//.aws//credentials"
  profile                 = "ivanti"
  region                  = "us-east-1"
}
#variable declaration

#String type variable

# variable "myvar" {
#   type    = "string"
#   default = "Hello Terraform"
# }
#Map Type variable

# variable "mymap" {
#   type = map(string)
#   default = { mykey1 = "value1" }
# }
#List variable

####################################

#resource decaration

# resource "aws_eip" "ip" {
#   vpc      = true
#   instance = "${aws_instance.TerraformExer.id}"
# }
resource "aws_s3_bucket" "s3bucket" {
  bucket = "terraformbucket2020"
}
resource "aws_instance" "TerraformExer" { # frist instance spinning
  ami           = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.TerraformExer.public_ip} > ip_address.txt"
  # }
  # depends_on = [aws_s3_bucket.s3bucket]
}
########################################

output "outputjson" {
  value = "${aws_instance.TerraformExer}"
}

