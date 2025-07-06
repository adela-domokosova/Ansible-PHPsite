resource "aws_instance" "tfer--i-05a04d78c6a5eb3a8_test" {
  ami                         = "ami-02003f9f0fde924ea"
  associate_public_ip_address = "true"
  availability_zone           = "eu-central-1a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }


  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = "0"
  key_name                             = "ec2_pem"

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "true"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  private_ip = "172.31.28.125"
  region     = "eu-central-1"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "8"
    volume_type           = "gp3"
  }

  source_dest_check = "true"
  subnet_id         = "subnet-08cb64ecdc5e52e70"

  tags = {
    Name = "test"
  }

  tags_all = {
    Name = "test"
  }

  tenancy                = "default"
  vpc_security_group_ids = [aws_security_group.imported_sg.id]
}
resource "aws_security_group" "imported_sg" {
  name        = "launch-wizard-3"     # DŮLEŽITÉ: musíme mít stejný název jako v AWS
  description = "launch-wizard-3 created 2025-07-06T09:15:19.085Z"
  vpc_id      = "vpc-0161f27f8531094d3"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}