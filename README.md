# Hybrid Cloud Automation

**Purpose:** Demonstrate infrastructure-as-code techniques for managing both cloud and on-premises environments in a unified way. This repository is intended for DevOps engineers and IT infrastructure professionals aiming to automate deployments across a hybrid cloud (e.g., Azure and VMware vSphere).

**Technologies & Tools:** Terraform, VMware vSphere (on-prem virtualization), Microsoft Azure (AzureRM Terraform provider), PowerShell/CLI for auxiliary automation tasks.

**Use Cases:**
- Deploy a new virtual machine in Azure and on VMware with one workflow.
- Maintain consistent configurations for cloud and on-prem VMs using Terraform modules.
- Provision and tear down development/test environments across hybrid infrastructure on-demand.

## Contents

- **Azure VM Terraform Template:** [`azure_vm.tf`](templates/azure_vm.tf) shows how to create an Azure VM (with networking) using Terraform.
- **VMware VM Terraform Template:** [`vmware_vm.tf`](templates/vmware_vm.tf) demonstrates provisioning a VM on a VMware vSphere cluster with Terraform.

## Usage

1. Ensure you have Terraform installed and configured with credentials for both Azure and vSphere.
2. Update the variables in each `.tf` file or supply a `terraform.tfvars` file to match your environment (Azure subscription, vSphere server, network IDs, etc.).
3. Initialize and apply for Azure:  
   ```bash
   cd templates
   terraform init 
   terraform apply -var-file=myvalues.tfvars -target=azurerm_virtual_machine.vm
   ```
4. Similarly, apply for VMware:  
   ```bash
   terraform init 
   terraform apply -var-file=myvalues.tfvars -target=vsphere_virtual_machine.vm
   ```

These templates can be used as starting points or combined into a single Terraform configuration that spans both Azure and VMware providers.
