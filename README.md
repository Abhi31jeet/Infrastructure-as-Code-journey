# Infrastructure-as-Code-journey

This repository documents my journey and technical progression. It contains production-grade Terraform configurations, architectural patterns, and automation workflows.

## 🚀 Project Overview
This project demonstrates modern Infrastructure as Code (IaC) principles using **Terraform** and **AWS**. The goal is to move away from manual "Click-Ops" toward a fully automated, version-controlled infrastructure.

## 🛠️ Tech Stack
- **Cloud Provider:** AWS (Amazon Web Services)
- **IaC Tool:** Terraform (HCL)
- **Version Control:** Git & GitHub
- **Concepts:** State Management, Resource Lifecycles, and Variable Injection.

## 📁 Repository Structure
- `provider.tf`: Defines the AWS provider and version constraints.
- `variables.tf`: Contains input variables to make the infrastructure reusable.
- `main.tf`: The core logic for AWS resources (e.g., S3 Buckets, IAM).
- `.gitignore`: Ensures sensitive state files and secrets are never committed.

## ⚙️ How to run
1. Clone the repo: `git clone <your-repo-url>`
2. Initialize: `terraform init`
3. Preview changes: `terraform plan`
4. Deploy: `terraform apply`


# 📝 Progression Log

### Day 1: Terraform Fundamentals
- Mastered the Core Workflow: `init`, `plan`, `apply`, `destroy`.
- Explored the **Terraform State File** (`.tfstate`) and its importance as the Source of Truth.
- Learned about **Immutability** and the `-/+` (Replace) resource lifecycle.

### Day 2: The Cloud Handshake & Variables
- Configured AWS CLI with IAM User for secure programmatic access.
- Implemented **Input Variables** to decouple configuration from code.
- Deployed a globally unique **S3 Bucket** using dynamic variable inputs.


### Day 3: Dynamic Infrastructure & Efficiency

#### **Infrastructure-as-Code (Terraform)**
On Day 3, I shifted from static configurations to **Dynamic Infrastructure**. The focus was on making code "aware" of its environment.
- **Data Sources:** Implemented `data` blocks to query the AWS API for real-time information (Account IDs and Availability Zones). This removes hardcoded dependencies and makes the code portable across different AWS accounts.
- **Outputs:** Defined explicit `output` values to surface critical resource information (like S3 Website Endpoints) directly to the CLI, facilitating automation and visibility.
- **Implicit Dependencies:** Leveraged Terraform's dependency graph to ensure resources (like Bucket Website Configurations) are created in the correct logical order.

### Day 4: State Management & Safety
- **Remote Backend:** Successfully migrated local state to AWS S3 for durability.
- **State Locking:** Implemented native S3 lockfile support to prevent concurrent execution conflicts.
- **Bootstrap Process:** Navigated the "Chicken-and-Egg" problem using a two-stage initialization.


### Day 5: Modularization & State Refactoring
- **Modules:** Refactored S3 Website logic into a reusable child module located in `./modules/s3-website`.
- **State Management:** Mastered `terraform state list` and `terraform state mv` to ensure zero-downtime refactoring.
- **Algorithms:** Implemented an iterative $O(n)$ time and $O(1)$ space solution for Reversing a Linked List.

### Project 1: Multi-Environment Portfolio Engine

#### Description
A production-grade Terraform framework that deploys isolated static websites across multiple environments using a single codebase.

#### Technical Stack
- **Terraform Workspaces:** Environment isolation for `dev` and `prod`.
- **Remote State:** Managed via S3 with DynamoDB locking.
- **Custom Modules:** Reusable S3 website component with automated policy injection.

#### Results
- **Dev URL:** http://abhijeet-portfolio-dev-2025.s3-website-us-east-1.amazonaws.com
- **Prod URL:** http://abhijeet-portfolio-prod-2025.s3-website-us-east-1.amazonaws.com


# Infrastructure-as-Code Journey: Week 2 - Networking

## 📌 Project Overview
Building upon the state management foundations from Week 1, Week 2 focuses on creating the **Network Skeleton** of a cloud environment. This project implements a highly scalable, modular Virtual Private Cloud (VPC) on AWS using Terraform.



## 🏗️ Architecture: The VPC Skeleton
This module automates the deployment of a secure networking environment, featuring:
- **Dynamic Subnetting:** Utilizes `for_each` loops to map subnets across multiple Availability Zones (AZs) for High Availability.
- **Internet Connectivity:** Automated provisioning of an Internet Gateway (IGW) and Route Tables.
- **CIDR Management:** Structured IP addressing using `/16` for the VPC and `/24` for subnets.

## 🚀 Key SRE Concepts Implemented
- **DRY (Don't Repeat Yourself):** Replaced hardcoded resource blocks with a single dynamic module.
- **Scalability:** The infrastructure can scale from 1 to 50 subnets by simply updating a Map variable—no code changes required.
- **Modular Inputs/Outputs:** Established a clear "contract" between the root configuration and the networking module using structured variables and outputs.

## 🛠️ Infrastructure Breakdown
| Resource | Purpose |
| :--- | :--- |
| `aws_vpc` | Isolated network container. |
| `aws_internet_gateway` | The entry/exit point for public traffic. |
| `aws_subnet` | Segmented IP ranges (multi-AZ). |
| `aws_route_table` | The "GPS" directing traffic to the Internet Gateway. |

## 💻 Deployment Commands
1. **Initialize:** `terraform init`
2. **Workspace Management:** `terraform workspace select dev`
3. **Deploy:** `terraform apply -auto-approve`
4. **Cleanup:** `terraform destroy -auto-approve`

## 🧠 Lessons Learned
- **Zombie Code Management:** Learned to identify and remove "leftover" variables and outputs from previous modules to prevent Terraform Plan errors.
- **Variable Mapping:** Mastered the use of `map(object({}))` to pass complex data structures into modules.


## Phase 2: Modular Networking & Cost Optimization

### Technical Highlights
- **Modular Design:** Decoupled networking logic into a reusable child module.
- **Network Isolation:** Built a multi-tier VPC with strictly private subnets for enhanced security.
- **Cost Engineering:** Replaced the standard AWS NAT Gateway (~$32/mo) with a custom-configured **NAT Instance** using Amazon Linux 2023, keeping the project within the **AWS Free Tier**.
- **IaC Best Practices:** Implemented automated formatting and rigorous `terraform validate` workflows to handle complex variable scoping.