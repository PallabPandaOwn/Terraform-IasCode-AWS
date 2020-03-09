resource "aws_key_pair" "mypubkey" {
  key_name   = "mypubkey.pub"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}" # Read public key content here
}
resource "aws_instance" "TerraformExer" { # EC2 Instance creation
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  
 # the VPC subnet
  subnet_id = aws_subnet.pallab-test-terraform-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  
  key_name      = "${aws_key_pair.mypubkey.key_name}"
  tags = {
    Name = "TerraformMachine"
  }



  # provisioner "file" {
  #   source      = "script.sh"
  #   destination = "/tmp/script.sh"
  #   connection {
  #   host        = "${aws_instance.TerraformExer.public_ip}"
  #   type        = "ssh"
  #   user        = "${var.INSTANCE_USERNAME}"
  #   private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  # }
  # }
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


