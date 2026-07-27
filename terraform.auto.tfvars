organization_id = "d9b58bd3-f3fc-4056-a026-1163297e80a8"

workspaces = {
  webhook-v2-env1 = {
    name             = "webhook-v2-env1"
    repository       = "https://github.com/jakegroves/terrakube-terraform-multienv.git"
    vcs_name         = "GitHub"
    template_name    = "Plan and Apply"
    branch           = "main"
    folder           = "environments/env1/"
    iac_version      = "1.12.0"
    webhooks_enabled = true
  }
  webhook-v2-env2 = {
    name             = "webhook-v2-env2"
    repository       = "https://github.com/jakegroves/terrakube-terraform-multienv.git"
    vcs_name         = "GitHub"
    template_name    = "Plan and Apply"
    branch           = "main"
    folder           = "environments/env2/"
    iac_version      = "1.12.0"
    webhooks_enabled = true
  }
  webhook-v2-env3 = {
    name             = "webhook-v2-env3"
    repository       = "https://github.com/jakegroves/terrakube-terraform-multienv.git"
    vcs_name         = "GitHub"
    template_name    = "Plan and Apply"
    branch           = "main"
    folder           = "environments/env2/"
    iac_version      = "1.12.0"
    webhooks_enabled = true
  }
}
