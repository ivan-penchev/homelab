# terraform-proxmox-ansible

This project provides Terraform modules for creating either Virtual Machines (VMs) or Linux Containers (LXC) in Proxmox. It also integrates Ansible for post-creation configuration management, specifically for installing Nginx on a Debian LXC container.

## Project Structure

```
terraform-proxmox-ansible
├── modules
│   ├── proxmox_lxc        # Module for creating LXC containers
│   ├── proxmox_vm         # Module for creating VMs
├── examples
│   └── debian-nginx-lxc   # Example of creating a Debian LXC with Nginx
├── ansible
│   ├── roles
│   │   └── nginx          # Ansible role for installing Nginx
│   ├── ansible.cfg        # Ansible configuration file
│   ├── inventory.tf       # Ansible inventory for managing hosts
│   └── playbook.yml       # Ansible playbook for Nginx installation
├── main.tf                # Entry point for Terraform configuration
├── outputs.tf             # Outputs for the overall Terraform project
├── providers.tf           # Provider configurations for Terraform
├── terraform.tfvars.example # Example variable values for Terraform
├── variables.tf           # Input variables for the overall project
└── README.md              # Project documentation
```

## Getting Started

### Prerequisites

- Terraform installed on your machine.
- Ansible installed on your machine.
- Access to a Proxmox server.