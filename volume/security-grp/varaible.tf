variable "security_group_name" {
    type = string
}

variable "ingress_rules" {
    type = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = string
    }))
}

variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  }))
}
