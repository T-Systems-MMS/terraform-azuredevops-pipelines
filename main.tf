resource "azuredevops_build_definition" "build_definition" {
  for_each = var.build_definition

  name            = local.build_definition[each.key].name == "" ? each.key : local.build_definition[each.key].name
  project_id      = local.build_definition[each.key].project_id
  path            = local.build_definition[each.key].path
  agent_pool_name = local.build_definition[each.key].agent_pool_name

  repository {
    branch_name           = local.build_definition[each.key].repository.branch_name
    repo_id               = local.build_definition[each.key].repository.repo_id
    repo_type             = local.build_definition[each.key].repository.repo_type
    service_connection_id = local.build_definition[each.key].repository.service_connection_id
    yml_path              = local.build_definition[each.key].repository.yml_path
    report_build_status   = local.build_definition[each.key].repository.report_build_status
  }

  ci_trigger {
    use_yaml = local.build_definition[each.key].ci_trigger.use_yaml
  }
}
