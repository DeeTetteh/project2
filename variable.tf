variable "region" {
    default = "eu-west-2"
    description = "AWS region"
}

variable "cidr_block" {
    default = "10.0.0.0/16"
    description = "vpc cidr_block"
}

variable "Test-public-sub1-cidr_block" {
    default = "10.0.1.0/24"
    description = "pubsub1 cidr_block"
}

variable "Test-public-sub2-cidr_block" {
    default = "10.0.2.0/24"
    description = "pubsub2 cidr_block"
}

variable "Test-priv-sub1-cidr_block" {
    default = "10.0.3.0/24"
    description = "privsub1 cidr_block"
}

variable "Test-priv-sub2-cidr_block" {
    default = "10.0.4.0/24"
    description = "privsub2 cidr_block"
}

variable "Test-serve-1-ami" {
    default = "ami-0eb260c4d5475b901"
    description = "test serve 1 ami type"
}

variable "Test-serve-1-instance_type" {
    default = "t2.micro"
    description = "test serve 1 instance type"
}

variable "Test-serve-2-ami" {
    default = "ami-0eb260c4d5475b901"
    description = "test serve 2 ami type"
}

variable "Test-serve-2-instance_type" {
    default = "t2.micro"
    description = "test serve 2 instance type"
}