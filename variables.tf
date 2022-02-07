variable "build_definition" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    build_definition = {
      name            = ""
      path            = "\\"
      agent_pool_name = "Azure Pipelines"
      variable = {
        name           = ""
        value          = ""
        secret_value   = ""
        is_secret      = false
        allow_override = true
      }
      variable_groups = []
      repository = {
        branch_name           = "master"
        service_connection_id = ""
        yml_path              = "\\"
        report_build_status   = true
      }
      ci_trigger = {
        use_yaml = false
      }
      pull_request_trigger = {}
      schedules            = {}
    }
  }

  # compare and merge custom and default values
  build_definition_values = {
    for build_definition in keys(var.build_definition) :
    build_definition => merge(local.default.build_definition, var.build_definition[build_definition])
  }

  # merge all custom and default values
  build_definition = {
    for build_definition in keys(var.build_definition) :
    build_definition => merge(
      local.build_definition_values[build_definition],
      {
        for config in ["variable", "repository", "ci_trigger", "pull_request_trigger", "schedules"] :
        config => merge(local.default.build_definition[config], local.build_definition_values[build_definition][config])
      }
    )
  }
}
