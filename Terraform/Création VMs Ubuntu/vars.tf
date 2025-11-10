variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8y8saIIHts4/ER4BZXBYt/ZTwqJ01cPILI7ghGeimJ0Tpj0mKWA8mZkR5EISoml5wJADOeiXcqsFE96Ycazp0Qf2wQG/svj704kVIayhPKtTGCkk0iq3c++OnmnHuexrniwwwS2vX/FDQMRp6bl9MOD6c4ynA5r3p2TYJ3g/pWz2HtP50V+hoOCuDZYIakTx1SCMBIIADYZUE5gXuT9PZY7exrpNGn+LZA94g9tWw1WWFCa5yi+QEIXH9BRWA0N9p7Hz/teO3b0EPQDb+Ll7p+7AB/S+xeK4hxGYHZxrWymQhAzcrV245iyD3WmhimHnVwgZTcKpIjkSoORm4gE4X9NvspqAW9Ak1tbwLamhroGsmmlevS7XO1qlg3yAvkCXgi+UjxR8J6B2BJHpbnSwDGf2Lr3qfhAAFWztp2AFiCoPIihuc/2heQdWkPuHzAEwCqRAnN6NCcFaEZXRCYc2QqoRjgcsRMnkaMLYUpc3e9VGO0QHmXN89V6Lh7jEPR8E= fabrice@debian11"
}

variable "proxmox_host" {
    default = "proxmox"
}
variable "template_name" {
    default = "ubuntu-2004-init"
}

