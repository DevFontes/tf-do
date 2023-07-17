terraform {
  required_version = "~> 1.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "vm_devops" {
  image  = "ubuntu-22-04-x64"
  name   = "${var.droplet_name}-${count.index}"
  region = var.droplet_region
  size   = var.droplet_size
  # ssh_keys = [data.digitalocean_ssh_key.google_acc.id]
  ssh_keys = [digitalocean_ssh_key.ssh.fingerprint]
  count    = var.droplets_count

  provisioner "local-exec" {
    command = "echo Machine IP ${self.ipv4_address} created"
  }

  # connection {
  #   type        = "ssh"
  #   user        = "root"
  #   private_key = file("~/.ssh/id_rsa.pub")
  #   host        = digitalocean_droplet.vm_devops[*].ipv4_address
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "apt update",
  #     "apt install crul -y",
  #     "apt install nginx -y",
  #     "curl -fsSL https://get.docker.com | sh"
  #   ]
  # }
}

resource "digitalocean_ssh_key" "ssh" {
  name       = "vm-devops"
  public_key = file("~/.ssh/id_rsa.pub")
}