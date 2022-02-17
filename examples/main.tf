module "pipelines" {
  source = "registry.terraform.io/T-Systems-MMS/pipelines/azuredevops"
  build_definition = {
    build_dmc = {
      name       = "service-mgmt-dmc"
      project_id = module.project.project["project_name"].id
      path       = "\\service\\build"
      repository = {
        repo_type   = "TfsGit"
        repo_id     = "repositiry_id"
        branch_name = "refs/heads/master"
        yml_path    = "pipelines/build_dmc.yml"
      }
    }
  }
}
