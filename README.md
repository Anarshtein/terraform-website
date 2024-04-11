# Terraform AWS EC2 Instance with Apache, PHP, and MySQL

## Overview
This project uses Terraform to provision an EC2 instance on AWS running Ubuntu. It then configures the instance with Apache2, PHP, and MySQL. Additionally, it sets up a simple HTML form served by Apache, which interacts with a MySQL database via PHP to store user-provided information.

## Prerequisites
- AWS account with appropriate permissions
- AWS CLI installed locally and configure with the AWS account
- Terraform installed locally


## Usage
1. Clone this repository to your local machine:
git clone https://github.com/Anarshtein/terraform-website

2. Navigate to the project directory:
3. Initialize Terraform:
terraform init

4. Generate and review the Terraform execution plan to understand the changes that will be made:
5. Once the provisioning is complete, access the EC2 instance via its public IP address or DNS name.

6. Fill out the form hosted by the Apache server with a username and password, then submit.

7. Verify that the submitted information is successfully stored in the MySQL database.
