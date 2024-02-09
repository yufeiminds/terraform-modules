output "project_id" {
  value = vercel_project.self.id
}

output "vercel_domain" {
  value = "${vercel_project.self.name}.vercel.app"
}
