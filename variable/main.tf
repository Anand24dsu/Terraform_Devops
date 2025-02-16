resource "local_file" "pet" {
  filename = var.filename
  content  = "my pet's name ${random_pet.my_pet.id}"
  # depends_on = [ random_pet.my_pet ]
  file_permission = var.file_permission
}

resource "random_pet" "my_pet" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}
