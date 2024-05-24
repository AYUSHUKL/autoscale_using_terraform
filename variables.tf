# Define variables for instance type, AMI, and key pair
variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0c55b159cbfafe1f0"
}

variable "key_name" {
  default = "my-key-pair"
}
