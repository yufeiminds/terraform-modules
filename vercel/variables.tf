variable "project_name" {
  type        = string
  description = "(required) Project name on Vercel"
}

variable "repo" {
  type        = string
  description = "(required) Git repository full name, such as 'owner/repo'"
}

variable "git_provider" {
  type        = string
  default     = "github"
  description = "(optional) Git provider"
}

variable "framework" {
  type        = string
  default     = "nextjs"
  description = "(optional) Framework name"
}

variable "domain" {
  type        = string
  default = null
  description = "(optional) Domain name for vercel project"
}

variable "root_directory" {
  type = string
  default = null
  description = "(optional) The name of a directory or relative path to the source code of your project. If omitted, it will default to the project root."
}
