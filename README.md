FastAPI IaC Challenge – Merapar
This project is a technical challenge to provision a cloud-based service using Infrastructure as Code (IaC) that serves a dynamic HTML page.

Challenge Summary
Provision a service using IaC that serves an HTML page:

html

The saved string is dynamic string
🚀 Solution Overview This solution uses the following technologies:

AWS: ECS Fargate, ALB, ECR, VPC, Security Groups

Terraform: Infrastructure provisioning

Docker: Containerization of the FastAPI app

FastAPI: Python web framework for serving dynamic HTML

🏗️ Infrastructure The infrastructure is provisioned using Terraform and includes:

VPC and Subnets: Public subnets for ALB and ECS tasks

Security Groups: ALB and ECS-specific rules

ECS Fargate Cluster: Container orchestration with 1 running task

ECR: Stores Docker image of the FastAPI app

Application Load Balancer (ALB): Public entry point

Target Group: Connects ALB to ECS task

🐳 FastAPI Application The FastAPI application:

Serves an HTML page showing a dynamic string stored in a local file (string.txt)

Allows updating the string via an API endpoint (POST /update)

Returns the saved string at the root endpoint (GET /)

This allows updating the string without redeploying the container.
