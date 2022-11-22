variable "allocated_storage" {
  default     = 50
  description = "Allocated storage for database in GB"
  type        = number
}

variable "apply_immediately" {
  default     = false
  description = "Apply major database changes immediately"
  type        = bool
}

variable "db_admin_secret" {
  description = "Name of Secret Manager Secret to store DB Admin pass into"
  type        = string
}

variable "db_name" {
  description = "Name of a database to create in this instance"
  type        = string
}

variable "engine" {
  default     = "postgres"
  description = "Database Engine to use"
  type        = string
}

variable "engine_version" {
  description = "Version of engine to use"
  type        = string
}

variable "major_engine_version" {
  description = "Major engine verstion to use"
  type = string
}

variable "instance_class" {
  default     = "db.t3.medium"
  description = "Database Instance Class to provision DB as"
  type        = string
}

variable "instance_name" {
  description = "RDS Instance Name"
  type        = string
}

variable "multi_az" {
  default     = false
  description = "Launch a Multi-AZ RDS Instance"
  type        = bool
}

variable "option_group_name" {
  description = "DB Option Group to associate"
  type        = string
}

variable "parameter_group_name" {
  description = "Database Parameter group to apply"
  type        = string
}

variable "skip_final_snapshot" {
  default     = true
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  type        = bool
}

variable "shared_tags" {
  default     = {}
  description = "Map of tags to be applied to ECS Cluster and it's associated resources"
  type        = map(any)
}

variable "subnet_ids" {
  description = "List of Subnet IDs to deploy the Database into"
  type        = list(string)
}

variable "tags" {
  default     = {}
  description = "Map of Tags to add to the RDS Instance"
  type        = map(any)
}

variable "username" {
  description = "Admin Username for database"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of Security Group IDs to apply to DB Access"
  type        = list(string)
}

variable "backup_retention_period" {
  description = "Backup retention period for DB cluster"
  type        = number
}

variable "preferred_backup_window" {
  description = "Calendar window for prefered backup time"
  type        = string
}

variable "deletion_protection" {
  description = "Protects against accidental deletion of the databases"
  type        = bool
}

variable "storage_encrypted" {
  description = "Encrypt the storage volumes of the db"
  type        = bool
}

variable "kms_key_id" {
  description = "id for kms key used to encrypt storage"
  type        = string
}