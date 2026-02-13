output "instance_profile_name" {
  value       = aws_iam_instance_profile.ecr_profile.name
  description = "The name of the IAM instance profile"
}