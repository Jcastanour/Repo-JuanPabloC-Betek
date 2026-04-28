terraform {
  required_version = ">= 1.5" # Versión mínima de Terraform requerida

  required_providers {
    aws = {
      source  = "hashicorp/aws" # Provider oficial de AWS publicado por HashiCorp
      version = "~> 5.0"        # Acepta cualquier versión superior a 5 pero no salta al 6 por ejemplo. Todo dentro de 5.
    }
  }

}
provider "aws" {
  region = var.region # La región donde estara. Y la cojo desde las variables
}

