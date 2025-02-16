terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

resource "local_file" "objects" {
  count    = length(var.bella.food)
  filename = "${var.bella.name}_${count.index}.txt"
  content  = <<EOF
Name: ${var.bella.name}
Gender: ${var.bella.gender}
Age: ${var.bella.age}
Food: ${var.bella.food[count.index]}
Favorite Food: ${var.bella.favorite_food}
EOF
}