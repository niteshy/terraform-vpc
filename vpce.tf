variable "vpce_private_dns_enabled" {
  default = "true"
}

# interface vpce (cloudformation) 
resource "aws_vpc_endpoint" "vpce_cloudformation" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.cloudformation"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_cloudformation"
  }
}

# interface vpce (cloudtrail) 
resource "aws_vpc_endpoint" "vpce_cloudtrail" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.cloudtrail"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_cloudtrail"
  }
}

# gateway vpce (dynamodb) 
resource "aws_vpc_endpoint" "vpce_dynamodb" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  route_table_ids = [ "${aws_route_table.route_vpce.id}"]
  service_name = "com.amazonaws.us-east-1.dynamodb"
  tags = {
    Name = "vpce_dynamodb"
  }
}

# interface vpce (ec2) 
resource "aws_vpc_endpoint" "vpce_ec2" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.ec2"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_ec2"
  }
}

# interface vpce (ecr.api) 
resource "aws_vpc_endpoint" "vpce_ecr-api" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.ecr.api"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_ecr-api"
  }
}
# interface vpce (ecr.dkr) 
resource "aws_vpc_endpoint" "vpce_ecr-dkr" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.ecr.dkr"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_ecr-dkr"
  }
}

# interface vpce (ecs) 
resource "aws_vpc_endpoint" "vpce_ecs" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.ecs"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_ecs"
  }
}

# interface vpce (ecs-agent) 
resource "aws_vpc_endpoint" "vpce_ecs-agent" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.ecs-agent"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_ecs-agent"
  }
}


# interface vpce (ecs-telemetry) 
resource "aws_vpc_endpoint" "vpce_ecs-telemetry" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.ecs-telemetry"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_ecs-telemetry"
  }
}


# interface vpce (elasticloadbalancing) 
resource "aws_vpc_endpoint" "vpce_elasticloadbalancing" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.elasticloadbalancing"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_elasticloadbalancing"
  }
}

# interface vpce (events) 
resource "aws_vpc_endpoint" "vpce_events" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.events"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_events"
  }
}

# interface vpce (execute-api) 
resource "aws_vpc_endpoint" "vpce_execute-api" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.execute-api"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_execute-api"
  }
}
# interface vpce (glue) 
resource "aws_vpc_endpoint" "vpce_glue" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.glue"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_glue"
  }
}

# interface vpce (kinesis-firehose) 
resource "aws_vpc_endpoint" "vpce_kinesis-firehose" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.kinesis-firehose"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_kinesis-firehose"
  }
}

# interface vpce (kinesis-streams) 
resource "aws_vpc_endpoint" "vpce_kinesis-streams" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.kinesis-streams"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_kinesis-streams"
  }
}

# interface vpce (kms) 
resource "aws_vpc_endpoint" "vpce_kms" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.kms"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_kms"
  }
}

# interface vpce (logs) 
resource "aws_vpc_endpoint" "vpce_logs" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.logs"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_logs"
  }
}

# interface vpce (monitoring) 
resource "aws_vpc_endpoint" "vpce_monitoring" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.monitoring"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_monitoring"
  }
}

# gateway vpce (s3) 
resource "aws_vpc_endpoint" "vpce_s3" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  route_table_ids = [ "${aws_route_table.route_vpce.id}"]
  service_name = "com.amazonaws.us-east-1.s3"
  tags = {
    Name = "vpce_s3"
  }
}

# interface vpce (sns) 
resource "aws_vpc_endpoint" "vpce_sns" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  vpc_endpoint_type = "Interface"
  subnet_ids = [ "${aws_subnet.subnet_private_1.id}", "${aws_subnet.subnet_private_2.id}"]
  security_group_ids = [ "${aws_security_group.sg_vpce.id}" ]
  service_name = "com.amazonaws.us-east-1.sns"
  private_dns_enabled = "${var.vpce_private_dns_enabled}"
  tags = {
    Name = "vpce_sns"
  }
}