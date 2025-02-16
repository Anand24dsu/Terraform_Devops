terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    local = {
      source = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

resource "random_pet" "my_pet" {
  prefix    = "Mrs"
  separator = "."
  length    = 1
}

resource "local_file" "cat" {
  filename = "cat.txt"
  content  = "we love ${random_pet.my_pet.id}"
  file_permission = "0700"
}

resource "local_file" "dog" {
  filename = "dog.txt"
  content  = "we love ${random_pet.my_pet.id}"
  file_permission = "0700"
}

resource "local_file" "pet" {
  filename = "pet.txt"
  content  = "we love ${random_pet.my_pet.id}"
  file_permission = "0700"
}
