resource "aws_key_pair" "mypubkey" {
  key_name   = "mypubkey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}" #Read public key content here
}
resource "aws_instance" "TerraformExer" { # frist instance spinning
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.mypubkey.key_name}"
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp"
    connection {
    host        = "${aws_instance.TerraformExer.public_ip}"
    type        = "ssh"
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
  }
}
########################################
output "outputjson" {
  value = "${aws_instance.TerraformExer}"
}

