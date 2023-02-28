
variable "cidr" {
  type = string
}

variable "provider_region" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "public_subnet_tags" {
  type = map(string)
}

variable "private_subnet_tags" {
  type = map(string)
}