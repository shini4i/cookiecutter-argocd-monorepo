terraform {
  backend = "local"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "change_me"
  }
}

provider "kubectl" {
  config_context = "change_me"
}