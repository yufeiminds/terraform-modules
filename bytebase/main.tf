variable "instance_id" {
  description = "The id of the instance"
  type        = string
}

variable "instance_name" {
  description = "The name of the project"
  type        = string
}

variable "instance_host" {
  description = "The name of the project"
  type        = string
}

variable "instance_port" {
  description = "The name of the project"
  type        = string
}

variable "project_name" {
  type = string
  validation {
    condition     = can(regex("^[0-9A-Za-z]+$", var.project_name))
    error_message = "For the project_name value only a-z, A-Z and 0-9 are allowed."
  }
}

variable "project_title" {
  type = string
}

variable "project_key" {
  type = string
}

resource "random_password" "admin" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_password" "readonly" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "bytebase_project" "project" {
  resource_id   = var.project_id
  title         = var.project_title
  key           = var.project_key
  workflow      = "VCS"
  schema_change = "DDL"
}

resource "bytebase_instance" "instance" {
  resource_id = var.instance_id
  environment = bytebase_environment.prod.resource_id
  title       = var.instance_name
  engine      = "POSTGRES"

  # You need to specific the data source
  data_sources {
    title    = "admin data source"
    type     = "ADMIN"
    username = "admin"
    password = random_password.admin.result
    host     = var.instance_host
    port     = var.instance_port
  }

  # Add another data_sources with RO type
  data_sources {
    title    = "read-only data source"
    type     = "READ_ONLY"
    username = "readonly"
    password = random_password.readonly.result
    host     = var.instance_host
    port     = var.instance_port
  }
}

resource "bytebase_instance_role" "readonly_role" {
  name     = "readonly"
  instance = bytebase_instance.instance.resource_id

  password         = random_password.readonly.result
  connection_limit = 10
  valid_until      = "3000-12-31T00:00:00+08:00"

  attribute {
    super_user  = false
    no_inherit  = false
    create_role = false
    create_db   = false
    can_login   = true
    replication = false
    bypass_rls  = false
  }
}
