# RNCP DevOps System Administrator
<ins>**Evaluation en cours de Formation ECF2**</ins>

#  🚀 AUTOMATISER LE DEPLOIEMENT D'UNE INFRASTRUCTURE
# avec TERRAFORM & ANSIBLE

### ✅ Introdution
- Dans le cadre de ce projet, la mise en place d’une machine sous Debian servira à la fois de poste de développement et de contrôleur pour Ansible et Terraform .
- Ce poste aura une place centrale, et permettra de gérer l’infrastructure as code (IaC) et de développer dans un environnement uniforme et contrôlé.
- L’objectif est de créer un système où la configuration, le déploiement et la gestion de l’infrastructure seront automatisés et réplicables, réduisant ainsi les risques d’erreurs manuelles et augmentant la productivité.
- L’environnement de déploiement sera effectué sur PROXMOX VIRTUAL ENVIRONNEMENT qui est une solution de virtualisation libre de type "bare metal" basée sur l'hyperviseur Linux KVM.

### ✅ Architecture à déployer
<img width="349" height="349" alt="image" src="https://github.com/user-attachments/assets/2bc7b440-032e-4e68-bf49-e497754a31bb" />

- Le but est de mettre en place un serveur Nginx et ensuite d’afficher un « Bienvenue à la formation Terraform ».
- Les étapes à suivre :
    1. Mise en place de la connexion ssh avec resource "null_resource" "ssh_target" avec les variables
    2. Installation du package Nginx avec provisioner "remote-exec"
    3. Utiliser le provisioner "file" pour copier le fichier index.html
    4. Ensuite avec provisioner "remote-exec » on fait copier l’index.html dans le bon répertoire /var/www/html et aussi la conf Nginx pour changer le port d’écoute en 6666
    5. Enfin un test de connexion sur le port 6666 avec un curl sur l’adresse IP du serveur pour obtenir un résultat.
    6. Décrire la configuration des serveurs à déployer.
          a) Déployer deux VM sous Ubuntu 20.04.
          b) Ensuite avec Ansible, créer un user admin pour chaque serveur et établir la connexion ssh entre les deux serveurs.
