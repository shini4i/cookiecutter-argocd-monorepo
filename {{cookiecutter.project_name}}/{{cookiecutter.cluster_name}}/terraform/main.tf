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
  config_path    = "{{ cookiecutter.kubeconfig_path }}"
  config_context = "{{ cookiecutter.kubeconfig_context }}"
}

provider "helm" {
  kubernetes {
    config_path    = "{{ cookiecutter.kubeconfig_path }}"
    config_context = "{{ cookiecutter.kubeconfig_context }}"
  }
}

provider "kubectl" {
  config_context = "{{ cookiecutter.kubeconfig_context }}"
}