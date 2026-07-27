resource "terrakube_workspace_vcs" "workspace" {
  for_each = var.workspaces

  name               = each.value.name
  organization_id    = var.organization_id
  description        = each.value.description
  repository         = each.value.repository
  vcs_id             = data.terrakube_vcs.workspace[each.key].id
  template_id        = data.terrakube_organization_template.workspace[each.key].id
  branch             = each.value.branch
  folder             = each.value.folder
  execution_mode     = each.value.execution_mode
  iac_type           = each.value.iac_type
  iac_version        = each.value.iac_version
  allow_remote_apply = each.value.allow_remote_apply
}

resource "terrakube_workspace_webhook_v2" "workspace" {
  for_each = local.webhook_workspaces

  organization_id = var.organization_id
  workspace_id    = terrakube_workspace_vcs.workspace[each.key].id
  # Required to use the shared-webhook path: one GitHub webhook per
  # repository, dispatching to every workspace that shares it, rather
  # than a separate registration per workspace.
  migrated_v2 = true
}

# Any PR touching this workspace's folder gets a plan posted as a PR
# comment, regardless of what branch it targets.
resource "terrakube_workspace_webhook_event" "pull_request" {
  for_each = local.webhook_workspaces

  webhook_id          = terrakube_workspace_webhook_v2.workspace[each.key].id
  event               = "PULL_REQUEST"
  branch              = [".*"]
  path                = ["${each.value.folder}.*"]
  template_id         = data.terrakube_organization_template.plan_only.id
  pr_workflow_enabled = true
}

# A commit landing on `branch` that touches this workspace's folder
# runs the workspace's own template (Plan and Apply).
resource "terrakube_workspace_webhook_event" "push" {
  for_each = local.webhook_workspaces

  webhook_id  = terrakube_workspace_webhook_v2.workspace[each.key].id
  event       = "PUSH"
  branch      = [each.value.branch]
  path        = ["${each.value.folder}.*"]
  template_id = data.terrakube_organization_template.workspace[each.key].id
}
