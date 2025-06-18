#####################  SET YOUR OWN VALUES BELOW #####################
######################################################################
######################################################################

# EXAMPLE region = "us-east-1"
region = "set-your-preferred-region"

# EXAMPLE certificate_arn = "arn:aws:acm:us-east-1:311141565994:certificate/85a70a..................."
certificate_arn = "set-arn-of-created-acm-certificate-for-your-domain"

# EXAMPLE hosted_zone_name = "projectdevops.eu"
hosted_zone_name = "your-domain.com" 

############################  ECS CLUSTER  #############################
# EXAMPLE cluster_name = "ecs-cluster"
cluster_name           = "set-your-ecs-cluster-name"
# EXAMPLE log_group_name = "ecs-logs"
log_group_name         = "set-ecs-logs-name"
# EXAMPLE logs_retention_in_days = 7
logs_retention_in_days = 7
######################  APPS LIST SERVICES+TASK ########################
apps = [
  {
    task_definition = {
      container = {
        name             = "nginx"   #
        image_tag        = "nginx"
        container_port   = 80
        healthcheck_path = "http://localhost:80" # REQUIRED HEALTH PATH
        stream_prefix    = "proxy"
      }
      config = {
        family = "task-definition-nginx"
        cpu    = "256"
        memory = "512"
      }
    }
    service_name  = "service-nginx"
    replica_count = 2
    domain_path   = "app1"
  }
]




