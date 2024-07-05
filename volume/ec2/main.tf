resource "aws_instance" "AWS_instance" {
	ami = var.ami
	instance_type = var.instance_type
	subnet_id = var.subnetid
	associate_public_ip_address = true
	security_groups = [var.security_group]
	key_name = var.keypair


	user_data = file("/home/shaivin-sagar/script.sh")
}