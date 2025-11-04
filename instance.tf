resource "aws_instance" "dev_instance" {
  ami                         = "ami-07860a2d7eb515d9a" 
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.dev_key.key_name
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.dev_sg.id]
  associate_public_ip_address = true
 
  tags = {
    Name = "dev-instance"
  }
  provisioner "local-exec" {
    command = <<EOT
      echo "Waiting 90s for ec2 instance to be ready to ssh into ..."
      sleep 90
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${aws_instance.dev_instance.public_ip}, --private-key ~/.ssh/dev_key -u ec2-user ./apache.yml
    EOT
  }
}

