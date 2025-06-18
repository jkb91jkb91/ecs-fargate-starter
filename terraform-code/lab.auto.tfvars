### EC2 Values
ami           = "ami-04b4f1a9cf54c11d0"
instance_type = "t2.micro"
region        = "us-east-1"

### Tags
tags = {
  Environment = "TST"
}

instance_tags = {
  AWSLZ_Scheduler = "AWS"

}

certificate_arn = "arn:aws:acm:us-east-1:311141565994:certificate/85a70a39-cfd3-4e0a-8dba-e43da4114aec"
hosted_zone_name = "projectdevops.eu"
####################  MDP NAVIGATOR DEPENDENCIES ######################
cluster_name           = "ecs-cluster"
log_group_name         = "ecs-logs"
logs_retention_in_days = 7
#------------------------APPS LIST SERVICES+TASK-----------------------
apps = [
  {
    task_definition = {
      container = {
        name             = "nginx" # ITS PATH NAME >>> DOMAIN/PATH   AND CONTAINER NAME 
        image_tag        = "nginx"
        container_port   = 80
        healthcheck_path = "http://localhost:80/health" # REQUIRED HEALTH PATH
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
  }
]