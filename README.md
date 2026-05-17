AWS Terraform Project: Python Data Processing Container

Overview

This Terraform project deploys an AWS infrastructure to host a Python script in a container. The script:

Accesses an S3 bucket to download a Parquet file.

Filters the data as required.

Writes the processed data to a new file in a different S3 directory.

The infrastructure uses ECS (instead of the originally planned EKS) for container orchestration, AWS CodeBuild for building the Python script, and AWS CodePipeline for CI/CD, pulling code from GitHub and deploying to ECS.
Architecture

Core Components

Compute: ECS (Fargate/EC2) to host the containerized Python script.

Storage: S3 buckets for input/output Parquet files.

CI/CD: AWS CodePipeline + CodeBuild (replaced Jenkins).

Networking: VPC, security groups, and subnets for secure communication.

IAM: Roles, policies, and users for least-privilege access.

Container Registry: ECR to store the Docker image of the Python script.

Legacy: EKS and ASG (originally planned, now deprecated in favor of ECS).

Data Flow

Code Source: Python script and Terraform code are hosted in separate GitHub repos.

Build: CodeBuild pulls the Python script, builds a Docker image, and pushes it to ECR.

Deploy: CodePipeline triggers ECS to run the container.

Execution: The container accesses S3, processes the Parquet file, and writes the output back to S3.

Project Structure

dataops-terraform/
├── infrastructure/
│   ├── developer-tools/
│   │   ├── code-build/       # CodeBuild project definitions
│   │   └── code-pipeline/    # CodePipeline configurations
│   ├── ec2/
│   │   ├── auto-scaling-groups/  # ASG for EC2 instances
│   │   ├── security-group/       # Security groups for EC2
│   │   ├── key-pairs/            # SSH key pairs
│   │   └── instances/            # EC2 instance definitions
│   ├── ecr/                   # ECR repositories
│   ├── ecs/                   # ECS cluster, tasks, and services
│   ├── eks/                   # (Legacy) EKS cluster definitions
│   ├── iam/
│   │   ├── groups/            # IAM groups
│   │   ├── policies/          # IAM policies
│   │   ├── roles/             # IAM roles
│   │   └── users/             # IAM users
│   ├── s3/                    # S3 buckets and policies
│   └── vpc/                   # VPC, subnets, and security groups
│
└── modules/
    ├── developer-tools/
    │   ├── code-build/       # Reusable CodeBuild module
    │   └── code-pipeline/    # Reusable CodePipeline module
    ├── ec2/
    │   ├── auto-scaling-groups/  # Reusable ASG module
    │   ├── security-group/       # Reusable security group module
    │   ├── key-pairs/            # Reusable key pair module
    │   └── instances/            # Reusable EC2 instance module
    ├── ecr/                   # Reusable ECR module
    ├── ecs/                   # Reusable ECS module
    ├── eks/                   # (Legacy) Reusable EKS module
    ├── iam/
    │   ├── groups/            # Reusable IAM group module
    │   ├── policies/          # Reusable IAM policy module
    │   ├── roles/             # Reusable IAM role module
    │   └── users/             # Reusable IAM user module
    ├── s3/                    # Reusable S3 module
    └── vpc/                   # Reusable VPC module

Prerequisites
AWS Account: With permissions to create ECS, ECR, S3, IAM, VPC, CodeBuild, and CodePipeline resources.

Terraform: v1.5+ installed locally.

GitHub: Repositories for Terraform and Python scripts.

Docker: For local testing of the Python container (optional).

Setup
1. Clone the Repository
Bash
git clone https://github.com/your-org/dataops-terraform.git
cd dataops-terraform

2. Configure AWS Credentials
   
Set up your AWS credentials in ~/.aws/credentials or via environment variables:
Bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_REGION="eu-west-1"  # Adjust as needed

4. Initialize Terraform
Bash
terraform init

Usage

Deploy Infrastructure
Bash
terraform plan   # Review changes
terraform apply  # Deploy (type "yes" to confirm)


Destroy Infrastructure
Bash
terraform destroy  # Clean up all resources

Remote State
This project uses remote Terraform state (e.g., S3 backend) to share state across modules. Configure the backend in main.tf:
Hcl
terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "dataops-terraform/terraform.tfstate"
    region = "eu-west-1"
  }
}

Modules

developer-tools: CodeBuild and CodePipeline modules for CI/CD.
ec2: EC2 instances, ASG, security groups, and key pairs.
ecr: ECR repositories for Docker images.
ecs: ECS cluster, task definitions, and services for the Python container.
eks: (Legacy) EKS cluster definitions.
iam: IAM groups, policies, roles, and users.
s3: S3 buckets and policies for input/output Parquet files.
vpc: VPC, subnets, and security groups.

Troubleshooting

Permission Errors: Ensure IAM roles have the correct policies attached.
CodeBuild Fails: Check the build logs in AWS Console for errors in the Dockerfile or Python script.
Terraform State Issues: Use terraform state list to inspect resources and terraform import if needed.
