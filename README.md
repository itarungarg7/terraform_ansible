# terraform_ansible
Overview
This project involves the deployment and management of Azure resources using Terraform and Ansible. The infrastructure is defined using Terraform, and Ansible is used for configuration management. The deployment process is orchestrated using Azure Pipelines. The project is structured into different stages for validation, deployment, and destruction of the infrastructure.

- **azure-pipelines.yml**
This YAML file defines the Azure Pipeline for the project. It is divided into stages:

tfvalidate: This stage validates the Terraform configuration.
tfdeploy: This stage deploys the infrastructure using Terraform. It depends on the successful completion of the validation stage.

- **azure-pipelines-destroy.yml**
This YAML file is responsible for destroying the deployed infrastructure. It is triggered by changes to the main branch. It includes a single stage:

tfdestroy: This stage contains a job named destroy that uses Terraform to destroy the previously deployed infrastructure.

- **jsb_key.pem**
This file contains the private key used for SSH connections to the Azure VM instances.

- **main.tf**
This Terraform configuration file defines the main infrastructure components. It includes:

Azure Backend Configuration: Specifies the Azure backend details for storing Terraform state.
Provider Configuration: Configures the Azure provider for Terraform.
Module "compute": Deploys Azure resources like virtual machines, networks, and security groups.
Output "public_ip": Exposes the public IP address of the deployed VM.
Local File and Null Resources: Utilizes null resources to trigger SSH connections and file transfers to the deployed VM.

- **terraform.tfvars**
This file contains variable values that customize the deployment. Adjust these variables based on your requirements.

- **variables.tf**
This file defines input variables used in the Terraform configuration. Descriptions are provided for each variable to aid in understanding their purpose.

Pipeline Variables
The Azure Pipelines configurations use the following variables:

bkstrgrg
bkstrg
bkcontainer
bkstrgkey
These variables are used to configure the Azure Storage Backend for storing Terraform state.

**Ansible Configuration**

Ansible Control Node
The Ansible control node is hosted on an Azure VM, dynamically configuring other Azure VMs as Ansible agent nodes. This dynamic configuration is facilitated through the Terraform provisioning process.

Ansible Playbook (instance.yml)
The Ansible playbook instance.yml is transferred and executed on the Azure VMs. It dynamically configures them based on the specified roles and tasks.

**Getting Started**

1. Ensure you have the necessary permissions and credentials to deploy resources to Azure.
2. Modify the terraform.tfvars file to suit your deployment requirements.
3. Trigger the Azure Pipeline by pushing changes to the main branch.

**Notes**
1. Ensure that the jsb_key.pem file is secure and only accessible by authorized personnel.
2. Review and understand the Terraform configurations and variables before deployment.

**Disclaimer**
This project involves the deployment and destruction of infrastructure on Azure. Be cautious when executing destructive operations to avoid unintended consequences. Review and understand the scripts and configurations before running them.

**Happy Deploying!**
