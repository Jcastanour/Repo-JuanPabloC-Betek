# Examen Final Módulo 3 — Despliegue de IaC en AWS con Terraform

Despliegue de una página web estática de bienvenida en **Amazon S3 Static Website Hosting** usando Terraform como herramienta de Infraestructura como Código.

> Proyecto del módulo 3 de BeTek para CloudNova S.A.S.

---

## URL del sitio desplegado

**http://cloudnova-betek-pablocastano6.s3-website-us-east-1.amazonaws.com**

---

## Información del proyecto

| Campo | Valor |
|---|---|
| Estudiante | pablocastano6 |
| Proyecto | Betek |
| Ambiente | dev |
| Región AWS | us-east-1 |
| Bucket S3 | cloudnova-betek-pablocastano6 |
| Fecha | 27 de abril, 2026 |

---

## Estructura del proyecto

```
.
├── main.tf            # Configuración de Terraform y provider AWS
├── variables.tf       # Declaración de variables de entrada
├── terraform.tfvars   # Valores reales de las variables
├── s3.tf              # Recursos S3 (bucket, website, policy, objeto)
├── outputs.tf         # Salidas (URL, bucket name, ARN)
├── index.html         # Página web estática
├── .gitignore         # Archivos a ignorar en Git
└── README.md
```

---

## Recursos creados

| Recurso | Descripción |
|---|---|
| `aws_s3_bucket` | Bucket S3 que aloja la página |
| `aws_s3_bucket_website_configuration` | Activa Static Website Hosting |
| `aws_s3_bucket_public_access_block` | Desbloquea acceso público |
| `aws_s3_bucket_policy` | Permite lectura pública (`s3:GetObject`) |
| `aws_s3_object` | Sube el `index.html` al bucket |

Todos los recursos llevan los tags obligatorios:

- `Environment = "dev"`
- `Owner = "pablocastano6"`
- `Project = "Betek"`

---

## Requisitos

- [Terraform](https://www.terraform.io/downloads) `>= 1.5`
- [AWS CLI](https://aws.amazon.com/cli/) configurado con credenciales válidas (`aws configure`)
- Cuenta AWS con permisos sobre S3

---

## Comandos para desplegar

```bash
terraform init        # Descarga el provider AWS
terraform fmt         # Formatea los archivos .tf
terraform validate    # Valida la sintaxis del código
terraform plan        # Muestra el plan de ejecución (no aplica cambios)
terraform apply       # Aplica los cambios (requiere confirmación con "yes")
```

Al finalizar `apply`, Terraform imprime los outputs incluyendo la **URL funcional** del sitio.

---

## Cómo destruir la infraestructura

```bash
terraform destroy
```

Elimina los 5 recursos creados. Requiere confirmación con `yes`.
