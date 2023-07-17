output "droplet_ip" {
  value = digitalocean_droplet.vm_devops[*].ipv4_address
}