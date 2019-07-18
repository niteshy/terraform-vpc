variable "vpce_private_dns_enabled" {
  default = true
}
variable "vpce_security_group_ids" {
  default = ["sg-0bf85b5ffee5b1afc"]
}

variable "vpce_route_table_ids" {
  default = ["rtb-0dd3d0d3d0ffa4dd1"]
}

# resource "aws_vpc_endpoint" "vpce_dynamodb" {
#   vpc_id = "${var.vpc_id}"
#   subnet_ids = "${var.private_subnet_ids}"
#   route_table_ids = "${var.vpce_route_table_ids}"
#   private_dns_enabled = "${var.vpce_private_dns_enabled}"
#   service_name = "com.amazonaws.us-east-1.dynamodb"
#   tags = {
#     Name = "vpce_dynamodb"
#   }
# }

# resource "aws_vpc_endpoint" "vpce_ecs" {
#   vpc_id = "${var.vpc_id}"
#   subnet_ids = "${var.private_subnet_ids}"
#   security_group_ids = "${var.vpce_security_group_ids}"
#   private_dns_enabled = "${var.vpce_private_dns_enabled}"
#   service_name = "com.amazonaws.us-east-1.ecs"
#   tags = {
#     Name = "vpce_ecs"
#   }
# }