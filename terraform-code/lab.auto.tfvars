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

certificate_arn = "arn:aws:acm:us-east-1:311141565994:certificate/a1314ff7-ca7a-4209-8243-8e9d24f73ad1"
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
        name             = "apps" # ITS PATH NAME >>> DOMAIN/PATH   AND CONTAINER NAME 
        image_tag        = "apps_7"
        container_port   = 80
        healthcheck_path = "http://localhost:80/health" # REQUIRED HEALTH PATH
        stream_prefix    = "proxy"
      }
      config = {
        family = "nginx-landing-page-task"
        cpu    = "256"
        memory = "512"
      }
    }
    service_name  = "nginx-service"
    replica_count = 2
  }
]