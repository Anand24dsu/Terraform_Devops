
variable "filename" {
  default = "petname.txt"
}

variable "content" {
  default     = "I love pets"
  type        = string
  description = "i love pets"
}

variable "prefix" {
  default     = "Mrs"
  type        = string
  description = "prefix"
}

variable "separator" {
  default = "."
}

variable "length" {
  default = 2
}


variable "file_permission" {
  type = string
  description = "Enter the the file Permission"
}