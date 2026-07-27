locals {
  webhook_workspaces = {
    for workspace_key, workspace in var.workspaces : workspace_key => workspace
    if workspace.webhooks_enabled
  }
}
