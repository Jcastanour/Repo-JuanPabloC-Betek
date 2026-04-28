variable "region" {
  type        = string
  description = "Region AWS donde desplegaremos"
  default     = "us-east-1"

}

variable "bucket_name" {
  type        = string
  description = "Nombre unico del bucket S3"
}

variable "owner" {
  type        = string
  description = "El dueño que esta haciendo este recurso (tag Owner)"
  default     = "pablocastano6"

}

variable "environment" {
  type        = string
  description = "Ambiente donde desplegaremos"
  default     = "dev"

}

variable "project" {
  type        = string
  description = "nombre que tendra el proyecto"
  default     = "Betek"

}

variable "student_name" {
  type        = string
  description = "Nombre del estudiante que va a aparecer"
  default     = "pablocastano6"

}