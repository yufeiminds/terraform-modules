terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

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
  default     = null
  description = "(optional) Domain name for vercel project"
}

resource "vercel_project" "wackify" {
  name      = var.project_name
  framework = var.framework
  git_repository = {
    type = var.git_provider
    repo = var.repo
  }
}

resource "vercel_project_domain" "wackify" {
  count      = var.domain != null ? 1 : 0
  project_id = vercel_project.example.id
  domain     = var.domain
}
