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

variable "mysql_version" {
  type        = string
  description = "The mysql version to use"
  default     = "8.0.23"
}

variable "master_username" {
  type        = string
  description = "Username for master user"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone where the instance shall be created"
}

variable "vpc" {
  type        = object({ id : string, cidr_block : string })
  description = "The VPC to create the cluster in"
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
