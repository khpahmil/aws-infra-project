# Provider AWS (untuk mengonfigurasi region dan kredensial)
provider "aws" {
  region = "ap-southeast-1"  # Ganti dengan region yang sesuai
}

# Output untuk public IP EC2 instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
