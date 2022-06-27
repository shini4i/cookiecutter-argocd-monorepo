# {{cookiecutter.project_name}}

## General information
This is just one of many possible monorepo structures.

### Project structure
```
- cluster-name -+ charts -+ umbrella-charts -+ Chart.yaml
                |                            + templates
                |                            + values.yaml
                |                            + secrets.yaml (SOPS encrypted)
                |
                + cluster-state -+ namespace -+ secrets +- sealedsecret.yaml
                |                             + app.yaml
                |
                + terraform -+ manifests -+ app-of-apps.yaml
                             + secrets -+ transcrypt_encrypted.yaml
                             + .*.tf
```

## Technologies
The technologies used in this project are the following:
- [ArgoCD](https://argo-cd.readthedocs.io)
- [Terraform](https://www.terraform.io/)
- [Transcrypt](https://github.com/elasticdog/transcrypt)
- [SealedSecrets](https://github.com/bitnami-labs/sealed-secrets)
- [SOPS](https://github.com/mozilla/sops)

Depending on project specifics some technologies mentioned above can be omitted.

## Bootstrap
### Provisioning
Kubernetes cluster and all relevant infrastructure components are out of scope of this project
### Deployment
Initial ArgoCD deployment is done manually using terraform code inside __cluster-name__/terraform directory.

Afterwards, all changes to ArgoCD are done using Atlantis pull request automation.
