provider "terrakube" {
  endpoint = "https://terrakube-api.platform.local"
  # export TERRAKUBE_TOKEN=".."
  # attach a token to the workspace as an env or export
}

terraform {
  backend "remote" {
    hostname     = "terrakube-api.platform.local"
    organization = "simple"

    workspaces {
      name = "terrakube-terraform-webhook-v22"
    }
  }
}
