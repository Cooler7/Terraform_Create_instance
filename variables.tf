variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "grsi-novo"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}
