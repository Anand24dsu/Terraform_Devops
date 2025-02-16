terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

resource "local_file" "my_self" {
  content  = jsonencode(var.anand)
  filename = "output.txt"
}