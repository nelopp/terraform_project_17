terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.54.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

# Creating VPC
resource "aws_vpc" "terraproj_17_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "terraproj_17_vpc"
  }
}

# Create Internet Gateway attach to VPC
resource "aws_internet_gateway" "terraproj_17_igw" {
  vpc_id = aws_vpc.terraproj_17_vpc.id

  tags = {
    Name = "terraproj_17_igw"
  }
}

# Create Public Subnet_1
resource "aws_subnet" "terraproj_17_pub_sub_1" {
  vpc_id     = aws_vpc.terraproj_17_vpc.id
  cidr_block = var.terraproj_17_pub_sub_1_cidr_block 
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraproj_17_pub_sub_1"
  }
}

# Create Public Subnet_2
resource "aws_subnet" "terraproj_17_pub_sub_2" {
  vpc_id     = aws_vpc.terraproj_17_vpc.id
  cidr_block = var.terraproj_17_pub_sub_2_cidr_block 
  availability_zone = "us-east-1a"
  tags = {
    Name = "terraproj_17_pub_sub_1"
  }
}

# Create Route Table and add public Route
resource "aws_route_table" "terraproj_17_pub_rtb_1" {
  vpc_id = aws_vpc.terraproj_17_vpc.id

  route {
    cidr_block = var.terraproj_17_pub_rtb_1
    gateway_id = aws_internet_gateway.terraproj_17_igw.id
  }

  tags = {
    Name = "terraproj_17_pub_rtb_1"
  }
}

# Associate Public Subnets_1 to Public Route Table
resource "aws_route_table_association" "terraproj_17_pub_rtb_1" {
  subnet_id      = aws_subnet.terraproj_17_pub_sub_1.id
  route_table_id = aws_route_table.terraproj_17_pub_rtb_1.id
}

# Create Private Subnet_1
resource "aws_subnet" "terraproj_17_priv_sub_1" {
  vpc_id     = aws_vpc.terraproj_17_vpc.id
  cidr_block = var.terraproj_17_priv_sub_1_cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name = "terraproj_17_pub_sub_1"
  }
}

# Create Private Subnet_2
resource "aws_subnet" "terraproj_17_priv_sub_2" {
  vpc_id     = aws_vpc.terraproj_17_vpc.id
  cidr_block = var.terraproj_17_priv_sub_2_cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name = "terraproj_17_pub_sub_2"
  }
}