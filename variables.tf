variable "region" {
  description = "The AWS region to deploy the resources in."
  type        = string
}
variable "email" {
  description = "name of the email to be used for the SNS topic"
  type        = string
}
variable "ami" {
  description = "value"
  type = string
}
variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
}
variable "key_name" {
  description = "The name of the key pair to use for SSH access to the instance."
  type        = string
}
variable "topic_name" {
  description = "The name of the SNS topic to create."
  type        = string
}