
variable "cidr" {
  type    = string
}

variable "provider_region" {
  type    = string
}

variable "azs" {
  type    = list
}

variable "private_subnets" {
  type    = list
}

variable "public_subnets" {
  type    = list
}