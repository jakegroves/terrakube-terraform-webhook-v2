variable "workspaces" {
  description = "VCS workspaces managed through PRs. Configure values in workspaces.auto.tfvars."

  type = map(object({
    name                    = string
    repository              = string
    vcs_name                = string
    template_name           = string
    description             = optional(string, "Managed by https://github.com/jakegroves/terrakube-terraform-webhook-v2")
    branch                  = optional(string, "main")
    folder                  = optional(string, "/")
    execution_mode          = optional(string, "remote")
    iac_type                = optional(string, "terraform")
    iac_version             = string
    allow_remote_apply      = optional(bool, false)
    project                 = optional(string)
    aws_dynamic_credentials = optional(bool, false)
    aws_account_id          = optional(string)
    webhooks_enabled        = optional(bool, false)
  }))

  default  = {}
  nullable = false
}

variable "workspace_import_ids" {
  description = "Terrakube VCS-workspace import IDs, keyed by the corresponding workspace catalog key."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "organization_id" {
  description = "Terrakube Org ID."
  type        = string
}
