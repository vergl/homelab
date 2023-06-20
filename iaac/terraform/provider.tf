terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "2.9.11"
        }
    }
}
provider "proxmox" {
    pm_debug = var.debug
    pm_log_enable = var.log_enable
    pm_log_file = var.log_file
    pm_log_levels = {
        _default    = "debug"
        _capturelog = ""
    }

    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret

    pm_tls_insecure = var.tls_insecure
}