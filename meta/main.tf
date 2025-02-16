resource "local_file" "pets" {
    filename = var.filename[count.index]
    content = "I love"
    count = length(var.filename)
}