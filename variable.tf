# variable
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}


# public subnet_1 cidr block
variable "terraproj_17_pub_sub_1_cidr_block" {
  default = "10.0.1.0/24"
}


# public subnet_2 cidr block
variable "terraproj_17_pub_sub_2_cidr_block" {
  default = "10.0.2.0/24"
}


# Create Route Table and add public Route
variable "terraproj_17_pub_rtb_1" {
  default = "0.0.0.0/00"
}


# private subnet_1 cidr block
variable "terraproj_17_priv_sub_1_cidr_block" {
  default = "10.0.3.0/24"
}


# private subnet_2 cidr block
variable "terraproj_17_priv_sub_2_cidr_block" {
  default = "10.0.4.0/24"
}