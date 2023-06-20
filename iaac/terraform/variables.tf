# Proxmox provider configuration
variable "proxmox_api_url" {
  description = "Your Proxmox API url"
  type        = string
}

variable "proxmox_api_token_id" {
  description = "The API token generated for terraform"
  type        = string
  sensitive   = true
}

variable "proxmox_api_token_secret" {
  description = "The API token secret"
  type        = string
  sensitive   = true
}

variable "ssh_user" {
  description = "User for remote_exec"
  type        = string
}

variable "ssh_password" {
  description = "Password for ssh_user"
  type        = string
  sensitive   = true
}

variable "debug" {
  description = "Debug mode"
  type        = bool
  default     = true
}

variable "log_enable" {
  description = "Enable logging"
  type        = bool
  default     = true
}

variable "log_file" {
  description = "Log filename if logging is enabled"
  type        = string
  default     = "terraform-log-file.log"
}

variable "tls_insecure" {
  description = "Ignore TLS certificate errors"
  type        = bool
  default     = true
}

# Kubernetes nodes configuration
variable "pm_node_name" {
  description = "Name of Proxmox node"
  type        = string
  default     = "proxmox"
}

variable "template_vm_name" {
  description = "Name of the VM template"
  type        = string
  default     = "ubuntu-server-2204"
}

variable "network_range" {
  description = "Network CIDR like 8,16,24,etc. Hint: 10.0.0.0/8"
  type        = number
  default     = 24
}

variable "network_gateway" {
  description = "Network gateway"
  type        = string
  default     = "192.168.0.1"
}

## Master nodes configuration
variable "master_node_num" {
  description = "Number of master nodes"
  type        = number
  default     = 3
}

variable "master_node_memory" {
  description = "Master node memory (in Mb)"
  type        = number
  default     = 8192
}

variable "master_node_cores" {
  description = "Master node cores"
  type        = number
  default     = 2
}

variable "master_node_disk_type" {
  description = "The type of disk device to add. Options: ide, sata, scsi, virtio"
  type        = string
  default     = "virtio"
}

variable "master_node_disk_size" {
  description = "The size of the created disk"
  type        = string
  default     = "50G"
}

variable "master_node_storage" {
  description = "The name of the storage pool on which to store the disk"
  type        = string
  default     = "ssd_disks"
}

variable "master_node_ips" {
  description = "List of ip addresses for master nodes (should be same length as master_node_num)"
  type        = list(string)
  default = [
    "192.168.0.131",
    "192.168.0.132",
    "192.168.0.133",
  ]
}

## Worker nodes configuration
variable "worker_node_num" {
  description = "Number of worker nodes"
  type        = number
  default     = 3
}

variable "worker_node_memory" {
  description = "Worker node memory (in Mb)"
  type        = number
  default     = 8192
}

variable "worker_node_cores" {
  description = "Worker node cores"
  type        = number
  default     = 2
}

variable "worker_node_disk_type" {
  description = "The type of disk device to add. Options: ide, sata, scsi, virtio"
  type        = string
  default     = "virtio"
}

variable "worker_node_disk_size" {
  description = "The size of the created disk"
  type        = string
  default     = "100G"
}

variable "worker_node_storage" {
  description = "The name of the storage pool on which to store the disk"
  type        = string
  default     = "ssd_disks"
}

variable "worker_node_ips" {
  description = "List of ip addresses for worker nodes (should be same length as worker_node_num)"
  type        = list(string)
  default = [
    "192.168.0.141",
    "192.168.0.142",
    "192.168.0.143",
  ]
}

## Bastion
variable "bastion_memory" {
  description = "Bastion memory (in Mb)"
  type        = number
  default     = 1024
}

variable "bastion_cores" {
  description = "Bastion cores"
  type        = number
  default     = 1
}

variable "bastion_disk_type" {
  description = "The type of disk device to add. Options: ide, sata, scsi, virtio"
  type        = string
  default     = "virtio"
}

variable "bastion_disk_size" {
  description = "The size of the created disk"
  type        = string
  default     = "10G"
}

variable "bastion_storage" {
  description = "The name of the storage pool on which to store the disk"
  type        = string
  default     = "ssd_disks"
}

variable "bastion_ip" {
  description = "IP address for bastion"
  type        = string
  default     = "192.168.0.150"
}

## Postgresql
variable "postgresql_memory" {
  description = "Postgresql memory (in Mb)"
  type        = number
  default     = 4096
}

variable "postgresql_cores" {
  description = "Postgresql cores"
  type        = number
  default     = 1
}

variable "postgresql_disk_type" {
  description = "The type of disk device to add. Options: ide, sata, scsi, virtio"
  type        = string
  default     = "virtio"
}

variable "postgresql_disk_size" {
  description = "The size of the created disk"
  type        = string
  default     = "20G"
}

variable "postgresql_storage" {
  description = "The name of the storage pool on which to store the disk"
  type        = string
  default     = "ssd_disks"
}

variable "postgresql_ip" {
  description = "IP address for postgresql"
  type        = string
  default     = "192.168.0.160"
}


## Docker VM
variable "docker_vm_memory" {
  description = "Docker VM memory (in Mb)"
  type        = number
  default     = 8192
}

variable "docker_vm_cores" {
  description = "Docker VM cores"
  type        = number
  default     = 2
}

variable "docker_vm_disk_type" {
  description = "The type of disk device to add. Options: ide, sata, scsi, virtio"
  type        = string
  default     = "virtio"
}

variable "docker_vm_disk_size" {
  description = "The size of the created disk"
  type        = string
  default     = "20G"
}

variable "docker_vm_storage" {
  description = "The name of the storage pool on which to store the disk"
  type        = string
  default     = "ssd_disks"
}

variable "docker_vm_ip" {
  description = "IP address for Docker VM"
  type        = string
  default     = "192.168.0.170"
}
