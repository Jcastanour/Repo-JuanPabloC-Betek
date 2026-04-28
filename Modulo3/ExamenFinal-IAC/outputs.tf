# estos outputs me sirven para cuando haga apply me salga bonito las cosas

output "website_url" { #quiero ver el url
  description = "URL del sitio web"
  value       = "http://${aws_s3_bucket_website_configuration.web.website_endpoint}"
}

output "bucket_name" { #Quiero ver como quedo creado el bucket
  description = "Nombre del bucket creado"
  value       = aws_s3_bucket.web.bucket
}

output "bucket_arn" { #quiero ver el arn
  description = "ARN del bucket"
  value       = aws_s3_bucket.web.arn
}
