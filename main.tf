data "aws_secretsmanager_secret" "db_pass" {
  name = var.db_admin_secret
}

resource "random_password" "db_pass" {
  length      = 24
  special     = false
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
}

resource "aws_secretsmanager_secret_version" "db_pass" {
  secret_id     = data.aws_secretsmanager_secret.db_pass.id
  secret_string = random_password.db_pass.result
}

resource "aws_db_subnet_group" "main" {
  name_prefix = var.instance_name
  subnet_ids  = var.subnet_ids
  tags        = var.tags
}


resource "aws_db_option_group" "postgres_12" {
  name                     = "${var.instance_name}-options"
  option_group_description = "DB Option Group for ${var.instance_name}"
  engine_name              = var.engine
  major_engine_version     = var.major_engine_version
}

resource "aws_db_parameter_group" "postgres_12" {
  name        = "${var.instance_name}-parameter-group"
  family      = "postgres12"
  description = "DB Parameter Group for ${var.instance_name}"
}

resource "aws_db_instance" "main" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  identifier             = var.instance_name
  multi_az               = var.multi_az
  name                   = var.db_name
  username               = var.username
  password               = random_password.db_pass.result
  parameter_group_name    = aws_db_parameter_group.postgres_12.id
  option_group_name       = aws_db_option_group.postgres_12.id
  skip_final_snapshot    = var.skip_final_snapshot
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = var.vpc_security_group_ids
  apply_immediately      = var.apply_immediately
  backup_retention_period = var.backup_retention_period
  backup_window = var.preferred_backup_window
  deletion_protection     = var.deletion_protection
  storage_encrypted       = var.storage_encrypted
  kms_key_id              = var.kms_key_id

  tags                   = var.shared_tags
}