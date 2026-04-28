# Queria modularizar. Este archivo lo hice asi por separado, para tener esta logica de s3 separada.
resource "aws_s3_bucket" "web" {
  bucket = var.bucket_name # Nombre que se trae de la variable

  tags = { #tags que tendra los variables ya se los trae de tfvars que los puse (o los default que hay en variables.tf)
    Name        = var.bucket_name
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}

#Ya el bucket esta creado. Pero hay que organizarlo para que sea funcional para alojar la pagina.
resource "aws_s3_bucket_website_configuration" "web" {
  bucket = aws_s3_bucket.web.id # apunta al bucket que ya creamos

  index_document {
    suffix = "index.html" # archivo que se muestra cuando entran a la raíz
  }
}


# Ya lo tengo listo y configurado para que sea de website. Pero hay que decirle que sea publico. pa poder verlo
resource "aws_s3_bucket_public_access_block" "web" {
  bucket = aws_s3_bucket.web.id

  block_public_acls       = false # permite ACLs públicas
  block_public_policy     = false # permite policies públicas (la más importante para nosotros)
  ignore_public_acls      = false # no ignora las ACLs públicas existentes
  restrict_public_buckets = false # no restringe buckets marcados como públicos
}

# Politica para poder usar
resource "aws_s3_bucket_policy" "web_public_read" {
  bucket = aws_s3_bucket.web.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.web.arn}/*"
    }]
  })

  depends_on = [aws_s3_bucket_public_access_block.web]
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.web.id
  key          = "index.html" # nombre con que queda guardado en el bucket
  source       = "index.html" # el recurso que usar para subir
  content_type = "text/html"  # decirle que es html

  tags = {
    Name        = "index.html"
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project
  }
}
