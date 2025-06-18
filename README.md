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
```
.
.
.
.
.
.
.
.
.
.
.
.
.
.
## ARTICLE  #########################################################################################################

🚀 How I Built a Production-Ready ECS Fargate Platform (with Terraform, ALB & Path-Based Routing)

In this post, I’ll show you how I built a modular, production-ready infrastructure platform using Terraform, AWS ECS with Fargate, ACM/HTTPS, and path-based routing via ALB — in a way that anyone can clone, customize, and deploy in minutes.

You’ll get the full free project, including code, architecture, and a working deployment example — and I’ll show you what’s in the PRO version, for those who want staging environments, CI/CD pipelines, and production-grade secrets and monitoring.

🧠 What Is This Project?

It’s a starter kit for launching multiple containerized apps on AWS ECS Fargate with a single ALB and domain — using Terraform only.

Each app is automatically routed via path-based routing:

https://yourdomain.com/app1
https://yourdomain.com/app2

The whole platform is:

🧱 Modular (VPC, ECS, ALB, IAM, Route53 modules)

⚡ Fast to deploy (Terraform only, no manual AWS Console clicking)

🔐 HTTPS by default (with ACM certificate)

📦 Designed for multiple services from the start

📦 What You Get – FREE Version

✅ GitHub repo with modular Terraform code✅ ECS Fargate + ALB setup with public HTTPS✅ DockerHub container support (no need for ECR)✅ Path-based routing (e.g. /api, /dashboard)✅ Terraform config to deploy services from a single variable block✅ Lightweight GitHub Actions pipeline for validation

🔗 GitHub: https://github.com/jkb91jkb91/ecs-fargate-starter

🏗️ Architecture Overview

The stack includes:

VPC with public subnets

ALB with HTTPS listeners

Security Groups

ECS Cluster with services defined in locals {}

IAM roles for Fargate

Terraform-managed Route53 DNS (optional)

Each service defined in locals.services gets:

a dedicated Target Group

a path rule in the ALB listener

a separate ECS Task Definition and Service

⚙️ How It Works

Clone the repo and set up lab.auto.tfvars with your domain and ACM cert ARN

Define your services in the locals block:

locals {
  services = {
    app1 = { cpu = 256, memory = 512, image = "nginx:alpine" },
    app2 = { cpu = 512, memory = 1024, image = "httpd:alpine" }
  }
}

Run terraform init && terraform apply

Your apps will be deployed to /app1, /app2, etc.

🤖 Built-in CI with GitHub Actions (Free Version)

This repo includes a minimal GitHub Actions workflow that runs on push or pull request:

✅ Checks Terraform format (terraform fmt)

✅ Runs terraform validate

✅ Builds Docker image in /app/ to ensure no syntax errors

You can extend it with deploy logic, tfsec, Trivy, etc.

🔐 PRO Version – What’s Included?

If you’re ready to go full production, the PRO version includes:

✅ GitHub Actions CI/CD: build → push to ECR → deploy ECS service

✅ ECR integration (build and version your containers)

✅ Multi-env: staging & production setup (separate ALB)

✅ Prometheus + Grafana monitoring stack

✅ Secrets via SSM Parameter Store + KMS

✅ Auto-scaling, alerting, backup-ready structure

✅ PDF Guide (20 pages) + zipped Terraform modules

🔗 Buy PRO version → https://gumroad.com/l/ecs-fargate-pro

💬 Who Is This For?

This is for you if:

You’re a DevOps / Platform Engineer who wants a reusable ECS boilerplate

You’re a solo developer deploying side projects with HTTPS

You want fast AWS deployment with Terraform and no Kubernetes

📈 Future Plans

Add ArgoCD deployment option (EKS PRO version coming soon)

Add Terraform Cloud backend support

Add simple Lambda + Fargate hybrid support

🙏 Final Words

I built this project for myself first — to stop rebuilding the same ECS setup over and over again. I hope it saves you time too 🚀

👉 Clone the free repo: https://github.com/jkb91jkb91/ecs-fargate-starter👉 Get the full version: https://gumroad.com/l/ecs-fargate-pro
