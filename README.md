# 🚀 Infrastructure-as-Code Journey (SRE Roadmap)

[![Terraform](https://img.shields.io/badge/Terraform-1.10+-623CE4?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Free--Tier-orange?logo=amazon-aws)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

This repository documents my journey and technical progression in Site Reliability Engineering. It contains production-grade Terraform configurations, architectural patterns, and automation workflows.

## 🏗️ Architecture: Production-Grade Stability
The current evolution focuses on **Backend Reliability** and **Container Orchestration**. By separating the management layer from the application layer, the infrastructure is resilient against state corruption and prepared for team collaboration.



### **Core Capabilities:**
- **Remote State Management:** Infrastructure "memory" is stored in AWS S3, ensuring persistence across different environments and machines.
- **Distributed State Locking:** Uses DynamoDB to prevent concurrent executions, a critical safety feature for SRE teams.
- **Containerized Workloads:** Automated deployment of Dockerized Nginx applications pulled directly from Amazon ECR.
- **Zero-Ingress Management:** Access is managed via AWS Systems Manager (SSM), keeping Port 22 closed to the public internet.

---

## 📝 Progression Log

### **Week 7: Remote State & Backend Resilience (Current)**
**Focus:** "Production-Grade IaC"
- **State Migration:** Successfully migrated `.tfstate` from local storage to a versioned **AWS S3 Bucket**.
- **State Locking:** Implemented a **DynamoDB table** to manage state locks, preventing race conditions.
- **Architectural Refactoring:** Reorganized the repository into `01-bootstrap` (Backend) and `02-app` (Resources) to protect the management layer from accidental destruction.
- **Force-Unlock Recovery:** Mastered the `force-unlock` procedure for resolving state-lock desynchronization during provider failures.

### **Week 6: Containerization & Cloud Deployment (Redo)**
**Focus:** "Shipping Code via Containers"
- **Docker Lifecycle:** Built a custom Alpine-based Nginx container and managed its lifecycle in **Amazon ECR**.
- **Template Injection:** Used the Terraform `templatefile` function to dynamically inject AWS Account IDs and Regions into Bash bootstrap scripts.
- **Automated Pull & Run:** Engineered `user_data` scripts to authenticate Docker with ECR and deploy the latest container version on boot.

### **Week 5: Containerization Foundations**
- **Identity Management:** Implemented IAM Instance Profiles to allow EC2 to pull images from ECR without hardcoded credentials.
- **Registry Setup:** Provisioned Private ECR repositories using Terraform.

### **Week 4: Security & Secret Management**
**Focus:** "Infrastructure Hardening"
- **IAM Instance Profiles:** Eliminated programmatic keys by assigning digital identities to EC2.
- **AWS Secrets Manager:** Implemented secure injection of API Keys and environment variables.
- **SSM Session Manager:** Removed SSH keys and closed Port 22 across the fleet.

### **Week 3: Observability & Resilience**
- **Load Balancing:** Implemented an ALB to distribute traffic and handle SSL termination.
- **CloudWatch Dashboards:** Built a centralized view for monitoring fleet-wide CPU utilization.
- **SNS Alerts:** Automated notifications for infrastructure anomalies.

### **Week 2: Networking & Connectivity**
- **VPC Design:** Built a custom VPC with dynamic subnetting across multiple AZs.
- **Cost Engineering:** Replaced expensive NAT Gateways with a custom **NAT Instance** to maximize AWS Free Tier utility.

---

## 📁 Repository Structure
```text
Infrastructure-as-Code-journey/
├── 01-bootstrap/            # Management Layer (Run Once)
│   └── backend-setup.tf     # S3 Bucket & DynamoDB Table
├── 02-app/                  # Application Layer
│   ├── main.tf              # EC2 & Security Group logic
│   ├── variables.tf         # Input definitions
│   ├── outputs.tf           # Public IP & DNS endpoints
│   └── scripts/             # Bash automation
│       └── install_docker.sh
├── terraform.tfvars         # Private values (GIT-IGNORED)
└── .gitignore               # Protection for secrets & local state
```

## ⚙️ Deployment Workflow
### Step 1: Bootstrap the Backend
```
Bash
cd 01-bootstrap
terraform init && terraform apply
```
### Step 2: Deploy the Application
```
Bash
cd ../02-app
terraform init -reconfigure
terraform apply
```

## 🧠 SRE Skills Demonstrated
- **Infrastructure as Code**: Advanced modularization, state locking, and remote backends.

- **Security**: Zero-Ingress architecture, IAM Least Privilege, and Secrets management.

- **Disaster Recovery**: State versioning and recovery procedures for locked infrastructure.

- **Automation** : Bash bootstrapping and dynamic configuration through Terraform templates.
