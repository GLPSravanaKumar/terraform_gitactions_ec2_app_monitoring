# 📈 Web Application Monitoring with Terraform and AWS SNS

This is a sample Terraform project designed to monitor the health of a web application and send notifications using **AWS SNS (Simple Notification Service)**.

## 🔧 Features

- 🛠️ Infrastructure as Code using Terraform
- 🌐 Monitors web application's availability (via custom script or external health check)
- 📬 Sends alerts via AWS SNS to configured email or SMS
- 🧑‍💻 Designed to run on an EC2 instance with a scheduled cron job

---

## 📁 Project Structure

├── main.tf # Main Terraform configuration
├── variables.tf # Input variables
├── outputs.tf # Output values
├── iam.tf # IAM role and instance profile for EC2
├── ec2.tf # EC2 instance for running health checks
├── sns.tf # SNS topic and subscription
├── scripts/
│ ├── health_check.py # Python script to perform web health check
│ └── config.yaml # YAML config for the health check script


## 🚀 How It Works

1. **Terraform** provisions:
   - An **EC2 instance** with permissions to publish to SNS
   - An **SNS topic and subscription** (email or SMS)
   - IAM role for EC2 to interact with AWS services

2. The EC2 instance:
   - Runs a scheduled **Python script (via cron)** to check the health of your web app
   - Sends a message to SNS if the app is unreachable or unhealthy

3. **SNS** delivers the alert to the specified email or phone number

---

## ⚙️ Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/GLPSravanaKumar/terraform_gitactions_ec2_app_monitoring.git
   cd terraform_gitactions_ec2_app_monitoring

