variable "prefix" {
  default = ["MR", "MRS", "SIR"]
  type    = list(string)
}

variable "name" {
  default = ["anand", "adarash", "gagana"]
  type    = list(string)
}

variable "age" {
  default = [22, 25, 25]
  type    = list(number)
}

variable "gender" {
  default = [true, true, false]  # Assuming true = Male, false = Female
  type    = list(bool)
}

variable "role" {
  default = {
    "anand"  = "dev",
    "gagana" = "manager",
    "adarash" = "qa"
  }
  type = map(string)
}
