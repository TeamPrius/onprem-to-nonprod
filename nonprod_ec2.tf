# first ec2 instance
resource "aws_instance" "amazonlinuxec2" {
  ami              	 	= "ami-02aead0a55359d6ec"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address   = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprod_sg.id}"]

  tags = {
    Name = "Amazon Linux 2 with .NET 6, PowerShell, Mono, and MATE Desktop Environment"
  }
}


# second ec2 instance
resource "aws_instance" "suselinuxec2" {
  ami              	 	= "ami-0d85a662720db9789"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address   = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprod_sg.id}"]

  tags = {
    Name = "SUSE Linux Enterprise Server 12 SP5 (HVM), SSD Volume Type"
  }
}


# third ec2 instance
resource "aws_instance" "ubuntuec2" {
  ami              	 	= "ami-0cd59ecaf368e5ccf"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address   = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprod_sg.id}"]

  tags = {
    Name = "Ubuntu Server 20.04 LTS (HVM), SSD Volume Type"
  }
}


# fourth ec2 instance
resource "aws_instance" "windowsec2" {
  ami              	 	= "ami-06a37c136ef94e249"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address   = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprod_sg.id}"]

  tags = {
    Name = "Microsoft Windows Server 2016 Core Base"
  }
}

# fifth ec2 instance
resource "aws_instance" "debianec2" {
  ami              	 	= "ami-058bd2d568351da34"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address   = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprod_sg.id}"]
  
  tags = {
    Name = "Debian 12 (HVM), SSD Volume Type"
  }
}


