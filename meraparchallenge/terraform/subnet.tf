#resource "aws_subnet" "public_subnet_a" {
#  vpc_id                  = "vpc-059a357798b0156fa"
#  cidr_block              = "172.31.64.0/20"
#  availability_zone       = "us-east-1a"
#  map_public_ip_on_launch = true

#  tags = {
#    Name = "public-subnet-a"
#  }
#}

#resource "aws_subnet" "public_subnet_b" {
#  vpc_id                  = "vpc-059a357798b0156fa"
#  cidr_block              = "172.31.80.0/20"
#  availability_zone       = "us-east-1b"
#  map_public_ip_on_launch = true

# tags = {
#    Name = "public-subnet-b"
#  }
#}