resource "aws_key_pair" "mypubkey" {
  key_name   = "mypubkey.pub"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}" #Read public key content here
}
resource "aws_instance" "TerraformExer" { # frist instance spinning
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.mypubkey.key_name}"
  tags = {
    Name = "HelloWorld"
  }
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
    host        = "${aws_instance.TerraformExer.public_ip}"
    type        = "ssh"
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
  }
  #  provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/script.sh",
  #     "sudo /tmp/script.sh",
  #   ]
  # }
  # provisioner "local-exec"{
  #   command = "echo ${aws_instance.TerraformExer} >> test.txt"
  # }
}
########################################


