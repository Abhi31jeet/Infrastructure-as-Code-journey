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


## 📝 Progression Log

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

#### Day 4: State Management & Safety
- **Remote Backend:** Successfully migrated local state to AWS S3 for durability.
- **State Locking:** Implemented native S3 lockfile support to prevent concurrent execution conflicts.
- **Bootstrap Process:** Navigated the "Chicken-and-Egg" problem using a two-stage initialization.
