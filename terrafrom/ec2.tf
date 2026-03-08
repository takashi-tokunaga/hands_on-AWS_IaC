resource "aws_security_group" "ec2" {
  name        = "test-iac-ec2-sg"
  description = "Allow SSH and HTTP/S"
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "ssh" {
  security_group_id = aws_security_group.ec2.id
  type              = "ingress"
  to_port           = 22
  from_port         = 22
  protocol          = "tcp"
  cidr_blocks       = ["{hogehoge}/32"] # 家のグローバルIP
}

resource "aws_security_group_rule" "http" {
  security_group_id = aws_security_group.ec2.id
  type              = "ingress"
  to_port           = 80
  from_port         = 80
  protocol          = "tcp"
  cidr_blocks       = ["{hogehoge}/32"] # 家のグローバルIP
}

resource "aws_security_group_rule" "https" {
  security_group_id = aws_security_group.ec2.id
  type              = "ingress"
  to_port           = 443
  from_port         = 443
  protocol          = "tcp"
  cidr_blocks       = ["{hogehoge}/32"] # 家のグローバルIP
}