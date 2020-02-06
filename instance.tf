provider "aws" {
  shared_credentials_file = "C://Users//pallab.panda//.aws//credentials"
  profile                 = "ivanti"
  region                  = "us-east-1"
}
resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.TerraformExer.id
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "Terraform-Bucket"
}

resource "aws_instance" "TerraformExer" {
  ami           = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.s3bucket]
}


output "outputjson" {
  value = "${aws_instance.TerraformExer}"
}

