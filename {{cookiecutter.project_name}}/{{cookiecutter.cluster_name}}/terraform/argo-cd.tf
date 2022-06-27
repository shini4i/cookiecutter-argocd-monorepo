resource "helm_release" "argo_cd" {
  name      = "argo-cd"
  namespace = "argo-cd"

  version = "4.9.7"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  max_history = 1

  values = [
    file("argo-cd.yaml")
  ]
}

data "kubectl_filename_list" "manifests" {
  pattern = "./manifests/*.yaml"
}

data "kubectl_filename_list" "secrets" {
  pattern = "./secrets/*.yaml"
}

resource "kubectl_manifest" "secrets" {
  for_each      = toset(data.kubectl_filename_list.secrets.matches)
  ignore_fields = ["live_resource_version"]
  yaml_body     = file(each.key)

  depends_on = [helm_release.argo_cd]
}

resource "kubectl_manifest" "manifests" {
  for_each      = toset(data.kubectl_filename_list.manifests.matches)
  ignore_fields = ["live_resource_version"]
  yaml_body     = file(each.key)

  depends_on = [kubectl_manifest.secrets]
}
