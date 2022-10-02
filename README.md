<div align="center">

# cookiecutter-argocd-monorepo
A cookiecutter template for bootstrapping a gitops monorepo for ArgoCD

<img src="https://raw.githubusercontent.com/shini4i/assets/main/src/cookiecutter/cookiecutter.png" alt="Showcase">

</div>

## Project description
This project aims to provide a cookiecutter template for bootstrapping gitops (ArgoCD) monorepo structure.

It will generate the bare minimum terraform configuration for ArgoCD configuration and a few Application manifest for installing some commonly used controllers.

## Prerequisites
- [cookiecutter](https://cookiecutter.readthedocs.io)
- [direnv](https://direnv.net/)
- [pre-commit](https://pre-commit.com/)
- [tfswitch](https://tfswitch.warrensbox.com/)
- [transcrypt](https://github.com/elasticdog/transcrypt)
- kubectl
- pwgen
- terraform
- yq

## Usage
```bash
cookiecutter git@github.com:shini4i/cookiecutter-argocd-monorepo.git
```
