variable "bella" {
    type = object({
      name = string
      gender=string
      age=number
      food=list(string)
      favorite_food=bool
    })
    default = {
      name="Anand"
      gender = "male"
      age = 22
      food = [ "dosa","idly","curd","rice" ]
      favorite_food = true
    }
  
}