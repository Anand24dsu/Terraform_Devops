terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0.0"
    }
    
  }
}

resource "local_file" "team_member" {
  count    = length(var.name)

  filename = "${var.prefix[0]}_${var.name[count.index]}.txt"
  content  = "Name: ${var.name[count.index]} || Age: ${var.age[count.index]} || Gender: ${lookup(var.gender, var.name[count.index], "Unknown")} || Role: ${lookup(var.role, var.name[count.index], "Unknown Role")}"

  file_permission = "0700"
#   lifecycle {
#     create_before_destroy = true
#   }
# lifecycle {
#   ignore_changes = all
# }
lifecycle {
  prevent_destroy = true
}

}