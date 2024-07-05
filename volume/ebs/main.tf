resource "aws_ebs_volume" "ebs" {
  availability_zone = var.vol_az
  size = var.vol_size
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = var.instance_id
}