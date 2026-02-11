output "public_ip" {
  value = aws_instance.this_compute.public_ip
}

output "instance_id" {
  value = aws_instance.this_compute.id
}
