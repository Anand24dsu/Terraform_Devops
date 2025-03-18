provider "aws" {
    region = "us-west-2"
}

resource "aws_subnet" "main" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.subnet_cidr
    availability_zone = "us-west-2a"
}

output "vpc_id" {
    value = aws_vpc.main.id
}