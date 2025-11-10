terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}


provider "proxmox" {
 
  pm_api_url = "https://192.168.1.10:8006/api2/json"
  pm_user = "root@pam"
  pm_password = ""
  # pm_api_token_id = "terraform@pam!terraform"
  # pm_api_token_secret = "﻿"
  pm_tls_insecure = true
} 

 
  
  # 1. Connexion ssh sur le serveur cible
resource "null_resource" "ssh_target" {
  connection {
    type        = "ssh"
    user        = var.ssh_user
    host        = var.target_ip
    private_key = file(var.ssh_private_key)
  }

  # 2. Installation NGINX
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y"
    ]
  }

  # 3. Copie du fichier HTML file
  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }

  # 4. Copie du fichier de configuration nginx
  provisioner "file" {
    source      = "nginx_custom.conf"
    destination = "/tmp/nginx_custom.conf"
  }

  # 5. Déplacement des fichiers et chargement de la conf nginx
  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo mv /tmp/nginx_custom.conf /etc/nginx/sites-available/default",
      "sudo systemctl reload nginx"
    ]
  }

  # 6. Test du serveur nginx sur le port 6666
  provisioner "remote-exec" {
    inline = [
      "sleep 2",
      "curl -s http://localhost:6666 | grep 'Bienvenue à la formation Terraform'"
    ]
  }
}

