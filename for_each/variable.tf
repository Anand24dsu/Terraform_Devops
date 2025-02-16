variable "filename" {
  type = map(string)
  default = {
    1 = "cow.txt"
    2 = "hen.txt"
    3 = "cat.txt"
  }
}
