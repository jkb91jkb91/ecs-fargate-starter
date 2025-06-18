variable "ami" {
  type        = string
  description = "AMI of the image"
}

variable "instance_type" {
  type        = string
  description = "instance_type"
}

variable "instance_tags" {
  type = map(any)
}

variable "tags" {
  type = map(any)
}

variable "log_group_name" {
  type = string
}

variable "region" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "logs_retention_in_days" {
  type = number
}

variable "hosted_zone_name" {
  type = string
}

variable "apps" {
  type = list(object({
    task_definition = object({
      container = object({
        name             = string
        image_tag        = string
        container_port   = number
        healthcheck_path = string
        stream_prefix    = string
      })
      config = object({
        family = string
        cpu    = string
        memory = string
      })
    })
    service_name  = string
    replica_count = number
  }))
}