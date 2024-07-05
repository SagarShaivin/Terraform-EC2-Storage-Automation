provider "aws" {
	region = "ap-south-1"
	access_key = "YourAccessKeyOfIAMuser"
	secret_key = "YourSecretKeyOfIAMuser"
}

module "keypair" {
	source = ".//key_pair"
}

module "ec2" {
  source = ".//ec2"

  ami = "ami-05e00961530ae1b55"
  instance_type = "t2.micro"
  subnetid = "subnet-055eab47dd7b83548"
  security_group = module.security_grp.security_group_id
  keypair = module.keypair.key-name
  device-name = "/dev/sdh"
}

module "ebs" {
    source = ".//ebs"

    device_name = "/dev/sdh"
    vol_az = "ap-south-1a"
    vol_size = 2
    instance_id = module.ec2.instance-id
}

module "security_grp" {
  source = ".//security-grp"

  security_group_name = "sec-grp-1"

  ingress_rules = [
	{
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = "0.0.0.0/0"
	},
	{
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = "0.0.0.0/0"
	}
  ]
  egress_rules = [
	{
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = "0.0.0.0/0"
	}
  ]
}