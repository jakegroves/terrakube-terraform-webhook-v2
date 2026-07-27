data "terrakube_vcs" "workspace" {
  for_each = var.workspaces

  name            = each.value.vcs_name
  organization_id = var.organization_id
}

data "terrakube_organization_template" "workspace" {
  for_each = var.workspaces

  name            = each.value.template_name
  organization_id = var.organization_id
}

# Used for the PR-triggered webhook event: PRs only ever get a plan +
# PR comment, never an apply, regardless of each workspace's own
# template_name (which governs the PUSH/apply trigger instead).
data "terrakube_organization_template" "plan_only" {
  name            = "Plan"
  organization_id = var.organization_id
}
