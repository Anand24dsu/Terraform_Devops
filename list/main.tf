terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

resource "local_file" "team_member" {
  count    = length(var.name)
  filename = "${element(tolist(var.prefix), count.index % length(tolist(var.prefix)))}_${var.name[count.index]}.txt"
  content = <<-EOT
    Name: ${var.name[count.index]}
    Age: ${var.age[count.index]}
    Gender: ${var.gender[count.index] ? "Male" : "Female"}  # Directly accessing gender list
    Role: ${lookup(var.role, var.name[count.index], "Unknown")}  # Lookup role using name as the key
  EOT
  directory_permission = "0777"
  file_permission      = "0700"
}
