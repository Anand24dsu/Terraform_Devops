resource "local_file" "hello" {
  filename = "hello.py"
  content  = "print('Hello, World!')"
}

data "local_file" "foo" {
  filename = local_file.hello.filename
}
