variable "ami_id" {
  type    = string
  default = "ami-03eb6185d756497f8"
}

variable "lb_security_group_name" {
  type = map(any)
  default = {
    "default" = "dashboard-lb-http-sg"
    "dev"     = "dev-dashboard-lb-http-sg"
    "staging" = "staging-dashboard-lb-http-sg"
    "prod"    = "prod-dashboard-lb-http-sg"
  }
}

variable "asg_security_group_name" {
  type = map(any)
  default = {
    "default" = "dashboard-asg-http-sg"
    "dev"     = "dev-dashboard-asg-http-sg"
    "staging" = "staging-dashboard-asg-http-sg"
    "prod"    = "prod-dashboard-asg-http-sg"
  }
}

variable "instance_type" {
  type = map(any)
  default = {
    "default" = "t2.nano"
    "dev"     = "t2.small"
    "staging" = "t2.medium"
    "prod"    = "t2.medium"
  }
}

variable "key_name" {
  type    = string
  default = "us-east-region"
}

variable "lt_name" {
  type = map(any)
  default = {
    "default" = "lt-dashboard"
    "dev"     = "dev-lt-dashboard"
    "staging" = "staging-lt-dashboard"
    "prod"    = "prod-lt-dashboard"
  }
}


variable "lb_name" {
  type = map(any)
  default = {
    "default" = "lb-dashboard"
    "dev"     = "dev-lb-dashboard"
    "staging" = "staging-lb-dashboard"
    "prod"    = "prod-lb-dashboard"
  }
}

variable "tg_name" {
  type = map(any)
  default = {
    "default" = "tg-dashboard"
    "dev"     = "dev-tg-dashboard"
    "staging" = "staging-tg-dashboard"
    "prod"    = "prod-tg-dashboard"
  }
}


variable "asg_name" {
  type = map(any)
  default = {
    "default" = "asg-dashboard"
    "dev"     = "dev-asg-dashboard"
    "staging" = "staging-asg-dashboard"
    "prod"    = "prod-asg-dashboard"
  }
}

variable "min_size" {
  type    = string
  default = "1"
}

variable "max_size" {
  type    = string
  default = "3"
}

variable "desired_capacity" {
  type    = string
  default = "2"
}