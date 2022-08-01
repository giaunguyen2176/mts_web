variable "cluster" {
  description = "The name of the cluster to deploy this service into, e.g. \"cluster1\""
}

variable "service" {
  description = "The name of the service to deploy cluster, e.g. \"api\""
}

variable "r53_zone" {
  description = "The name of the route53 zone to host this service, e.g. \"example.com\""
}

variable "r53_endpoint" {
  description = "The name of the endpoint to host this service, e.g. \"api.example.com\""
}

variable "task_definition" {
  type = object({
    memory = number
    cpu = number
  })
}

variable "containers" {
  description = "The object describe all containers"
  type = map(object({
    name = string
    container_port = string
    host_port = string
    image = string
    memory = number
    cpu = number
  }))
}