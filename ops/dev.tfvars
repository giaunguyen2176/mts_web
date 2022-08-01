cluster               = "mts-dev"
service               = "mts-web"
r53_zone              = "mts.escape30.com"
r53_endpoint          = "mts.escape30.com"
task_definition = {
  memory              = 1024
  cpu                 = 256
}
containers = {
  app = {
    name                = "mts_web"
    container_port      = 8080
    host_port           = 8080
    image               = "ghcr.io/giaunguyen2176/mts_web:latest"
    memory              = 256
    cpu                 = 10
  }
}