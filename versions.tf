terraform {
  required_version = ">= 1.7.0, < 2.0.0"

  required_providers {
    # terrakube = {
    #   source  = "terrakube-io/terrakube"
    #   version = "0.26.1"
    # }
    terrakube = {
      source  = "terrakube-registry.platform.local/simple/terrakube"
      version = "0.26.2"
    }
  }
}
