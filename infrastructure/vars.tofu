variable "aws_profile" {
    type        = string
    description = "AWS profile to use."
    default     = "private"
}

variable "aws_region" {
    type        = string
    description = "AWS region to deploy resources."
    default     = "eu-central-1"
}