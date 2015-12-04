variable cluster_name { }

resource "openstack_compute_secgroup_v2" "cluster" {
    name          = "${ var.cluster_name }"
    description   = "Security Group for ${ var.cluster_name }"
    rule {
      from_port   = -1
      to_port     = -1
      ip_protocol = "icmp"
      self        = true
    }
    rule {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
    }
    rule {
      from_port   = 8443
      to_port     = 8443
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
    }
    rule {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
    }
    rule {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
    }
}

output "cluster_name" {
  value           = "${ openstack_compute_secgroup_v2.cluster.name }"
}
