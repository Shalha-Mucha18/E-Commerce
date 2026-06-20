# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_ids" {
  description = "IDs of NAT Gateways"
  value       = module.vpc.nat_gateway_ids
}

output "nat_gateway_ips" {
  description = "Elastic IP addresses of NAT Gateways"
  value       = module.vpc.nat_gateway_ips
}

# EKS Cluster Outputs
output "cluster_id" {
  description = "ID/name of the EKS cluster"
  value       = module.eks.cluster_id
}

output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint for your EKS Kubernetes API"
  value       = module.eks.cluster_endpoint
}

output "cluster_version" {
  description = "Kubernetes version of the cluster"
  value       = module.eks.cluster_version
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

output "cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = module.eks.cluster_role_arn
}

output "node_role_arn" {
  description = "ARN of the EKS node IAM role"
  value       = module.eks.node_role_arn
}

output "node_group_ids" {
  description = "IDs of EKS node groups"
  value       = module.eks.node_group_ids
}

output "node_group_arns" {
  description = "ARNs of EKS node groups"
  value       = module.eks.node_group_arns
}

output "node_group_status" {
  description = "Status of EKS node groups"
  value       = module.eks.node_group_status
}

output "security_group_id" {
  description = "Security group ID of the EKS cluster"
  value       = module.eks.security_group_id
}

# Kubeconfig Output
output "kubeconfig" {
  description = "Kubeconfig content for kubectl configuration"
  value       = module.eks.kubeconfig
  sensitive   = true
}

# Summary Output
output "eks_cluster_info" {
  description = "Summary of EKS cluster configuration"
  value = {
    cluster_name    = module.eks.cluster_id
    cluster_version = module.eks.cluster_version
    endpoint        = module.eks.cluster_endpoint
    region          = var.aws_region
    vpc_id          = module.vpc.vpc_id
    node_groups     = var.node_groups
  }
}
