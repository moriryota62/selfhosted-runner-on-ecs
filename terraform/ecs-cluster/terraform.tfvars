base_name = "selfhosted-runner"

# EC2
vpc_id = "vpc-039d3da60322d444c"
private_subnet_ids = [
  "subnet-044d140ce6f7535de",
  "subnet-0f407e8a05dde5f17",
]
instance_type    = "t2.micro"
max_size         = 1
min_size         = 1
desired_capacity = 1
