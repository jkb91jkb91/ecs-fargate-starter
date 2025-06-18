# 🚀 ECS Fargate Starter – Free Version

A Terraform-based infrastructure starter project for deploying containerized applications to AWS ECS using Fargate.  
Designed as a simple, production-ready skeleton with HTTPS and modular components.

---

## ✅ What’s included?

| Component       | Description |
|------------------|-------------|
| **Terraform**     | Modular infrastructure definition |
| `modules/vpc`     | VPC with public subnets |
| `modules/lb`      | Application Load Balancer with HTTPS |
| `modules/sg`      | Security Groups |
| `modules/iam`     | IAM roles and policies for ECS tasks |
| `modules/ecs`     | ECS Fargate service (supporting multiple services via `locals`) |
| `modules/route53` | Optional DNS zone management |
| `lab.auto.tfvars` | Example configuration with domain and certificate |

---

## 🔧 Prerequisites

To run this project, you’ll need:

1. A registered domain in **Route 53** (hosted zone)
2. An existing **ACM certificate** in `us-east-1` (required for HTTPS via ALB)
3. **AWS credentials** configured in your environment  
   Either set the following environment variables:

```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
