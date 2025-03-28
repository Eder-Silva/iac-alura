# Define as configurações do Terraform e os provedores necessários
terraform {
  required_providers {
    aws = {
      # Especifica o provedor AWS do repositório oficial do Terraform (HashiCorp Registry)
      source  = "hashicorp/aws"   # Provedor oficial AWS da HashiCorp
      version = "~> 3.27"         # Usa qualquer versão entre 3.27.0 e antes da 4.0.0
    }
  }
  
  # Especifica a versão mínima do Terraform necessária para executar este código
  required_version = ">= 0.14.9"
}

# Define o provedor AWS e suas configurações
provider "aws" {
  profile = "default"    # Usa o perfil "default" configurado no AWS CLI
  region  = "us-west-2"  # Define a região da AWS (Oregon)
}

# Cria uma instância EC2 (máquina virtual)
resource "aws_instance" "app_server" {
  ami           = "ami-075686beab831bb7f" # ID da imagem (Ubuntu na região us-west-2)
  instance_type = "t2.micro"              # Tipo de instância (Free Tier elegível)
  
  # Define o par de chaves (Key Pair) que será usado para acessar a instância via SSH
  # "iac-alura" deve ser o nome de um Key Pair existente na sua conta AWS
  key_name = "iac-alura"

  tags = {
    Name = "Primeira Instancia"           # Nome para identificar a instância
  }
}






