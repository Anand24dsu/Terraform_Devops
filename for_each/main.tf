resource "local_file" "animal" {
   filename = each.value
   for_each = var.filename
   content = "Animals"
}