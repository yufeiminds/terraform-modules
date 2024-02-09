resource "vercel_project" "self" {
  name      = var.project_name
  framework = var.framework
  git_repository = {
    type = var.git_provider
    repo = var.repo
  }
  root_directory = var.root_directory
}

resource "vercel_project_domain" "self" {
  count      = var.domain != null ? 1 : 0
  project_id = vercel_project.self.id
  domain     = var.domain
}
