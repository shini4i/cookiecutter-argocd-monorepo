terraform {
  backend "local" {}

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "change_me"
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