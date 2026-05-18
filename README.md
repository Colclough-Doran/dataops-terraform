AWS Terraform Project: Python Data Processing Container

Overview
This Terraform project deploys an AWS infrastructure to host a Python script in a container. 

The script: https://github.com/Colclough-Doran/dataops-etl

Accesses an S3 bucket to download a Parquet file.
Filters the data as required.
Writes the processed data to a new file in a different S3 directory.
The infrastructure uses ECS (instead of the originally planned EKS) for container orchestration and GitHub Actions for CI/CD, pulling code from GitHub and deploying to ECS.

Core Components

Compute: ECS (Fargate/EC2) to host the containerized Python script.
Storage: S3 buckets for input/output Parquet files.
CI/CD: GitHub Actions.
Networking: VPC, security groups, and subnets for secure communication.
IAM: Roles, policies, and users for least-privilege access.
Container Registry: ECR to store the Docker image of the Python script.
Legacy: EKS, ASG, Jenkins Docker EC2 instances, CodeBuild and CodePipeline (kept in the GitHub repo for reference).

Data Flow

Code Source: Python script and Terraform code are hosted in separate GitHub repos.
Build: GitHub Actions pulls the Python script, builds a Docker image, and pushes it to ECR.
Deploy: GitHub Actions triggers ECS to run the container.
Execution: The container accesses S3, processes the Parquet file, and writes the output back to S3.

Prerequisites

AWS Account: With permissions to create ECS, ECR, S3, IAM, VPC, and GitHub Actions resources.
Terraform: v1.5+ installed locally.
GitHub: Repositories for Terraform and Python scripts.
Docker: For local testing of the Python container (optional).

Modules

developer-tools: (Legacy) CodeBuild and CodePipeline modules for CI/CD. 
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
