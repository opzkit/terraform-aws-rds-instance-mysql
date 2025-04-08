variable "identifier" {
  type        = string
  description = "Instance identifier"
}

variable "db_name" {
  type        = string
  description = "Initial database name"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "db.t3.small"
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage for instance"
  default     = 20
}

variable "mysql_version" {
  type        = string
  description = "The mysql version to use"
  default     = "8.0.23"
}

variable "master_username" {
  type        = string
  description = "Username for master user"
}

variable "vpc_id" {
  type        = string
  description = "VPC id create the cluster in"
}

variable "security_group_names" {
  type        = list(string)
  description = "List of security group names that should have access to the cache cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ids where cluster should be located"
}

variable "skip_final_snapshot" {
  type        = bool
  default     = false
  description = "Store final snapshot or not when destroying database"
}

variable "apply_immediately" {
  type        = bool
  default     = false
  description = "Apply changes immediately or wait for next maintenance window"
}

variable "enhanced_monitoring" {
  type        = bool
  default     = false
  description = "Enable enhanced monitor on the instance"
}

variable "storage_encrypted" {
  type        = bool
  default     = true
  description = "Enable storage encryption on the instance"
}

variable "parameters" {
  type        = map(string)
  default     = {}
  description = "parameter group overrides"
}

variable "kms_key_arn" {
  type        = string
  default     = null
  description = "KMS key to use for encryption, pass null to use AWS default KMS encryption"
}

variable "performance_insights_retention_period" {
  type        = number
  default     = 7
  description = "Performance insights retention period in days, 7 days is free of charge. Read more here: https://aws.amazon.com/rds/performance-insights/pricing"
}

variable "ca_cert_identifier" {
  type        = string
  default     = null
  description = "The CA cert identifier to use"
}
