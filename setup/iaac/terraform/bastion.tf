resource "proxmox_vm_qemu" "proxmox_vm_bastion" {
  count       = 1
  vmid        = "301"
  name        = "bastion"
  desc        = "Bastion Node"
  target_node = var.pm_node_name
  clone       = var.template_vm_name
  os_type     = "cloud-init"
  agent       = 1
  memory      = var.bastion_memory
  cores       = var.bastion_cores
  boot        = "order=virtio0;ide2;net0;ide0"
  disk {
    size     = var.bastion_disk_size
    type     = var.bastion_disk_type
    storage  = var.bastion_storage
    iothread = 1
  }

  ipconfig0 = "ip=${var.bastion_ip}/${var.network_range},gw=${var.network_gateway}"
  ciuser    = "stanislavgiley"
  sshkeys   = <<EOF
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/X2J5Hn670OHmpCoJOjPRySLVEnldthGx2L4Qo9rJ3thSVQdLwplS4a02I8Jl7L6RKD8wiPlfK5Au1xEJaga5tYCNGpqQkoiVM6ScJzZCt3amw5Tp3OE9YDCGKciq1ufKPLR93hh/sob21qGSdtV5VjHmzOxx8ay6jWnyi1bdOxmquk4pfvLn6NxLijuK015fj4nh3u2s8yIBsZGAUF8sbvj6bpvNOWPXk0EgtgYec8JYW1kW/QFXRDMEHijQrz8KXEoc2SqCHLuGBt3U3N7HY2atNTe2qek6QdfRQaCk4SVMeHVz1bw8pG1d2nh1ReD8O8UgKo1yPrtxjGfjMB7ng3TQkqLpXMBelJojrdZncP/BaJH9ZcZrJnWHXmT7pin/UnfNSy1z/Fcs88Bu6jXktVIzC3aSQJ2aOjSWJmyrelB3BqzE4BcHGdgjfaYHJMxXWMlN/jjRqORRdqweFqpomgOIPOO/0wi37aPneIY6SZP7TxqqQ6FpH4GnHdCnBas= stanislavgiley@MacBook-Pro-Stanislav-2.local 
  EOF

  # We have to manually reboot our VMs to make them have IP address we set in ipconfig0 (it get IP address from DHCP on first boot)
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo DEBIAN_FRONTEND=noninteractive apt install -y ansible python3-pip",
      "sudo shutdown -r +0"
    ]
    connection {
      type     = "ssh"
      host     = self.ssh_host
      user     = var.ssh_user
      password = var.ssh_password
      port     = self.ssh_port
    }
  }

  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      network
    ]
  }

}