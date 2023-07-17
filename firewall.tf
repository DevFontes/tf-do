resource "digitalocean_firewall" "fw_vm_devops" {
  name = "only-22"

  droplet_ids = digitalocean_droplet.vm_devops[*].id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "22"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}