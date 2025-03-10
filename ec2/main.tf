#security group
resource "aws_security_group" "webserver_access" {
        name = "webserver_access"
        description = "allow ssh and http"

        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }


}

resource "aws_instance" "ourfirst" {
  ami                    = "ami-00bb6a80f01f03502"
  availability_zone      = "ap-south-1b"
  subnet_id              = "subnet-08df04774a73f1298"
  instance_type          = "t2.micro"
  associate_public_ip_address = true
  #user_data              = filebase64("install_ansible.sh")
  vpc_security_group_ids = [aws_security_group.webserver_access.id]  # Correct reference
  key_name               = "JTA-KEYPAIR"
  
  tags = {
    Name      = "ec2-test"
    Location  = "Mumbai"
  }
}

output "ec2_public_ip" {
  value = aws_instance.ourfirst.public_ip
  description = "Public IP of the EC2 instance"
}
