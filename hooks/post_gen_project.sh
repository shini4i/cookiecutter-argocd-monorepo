#!/usr/bin/env bash

git_init() {
  echo "Initializing git repository"
  git init
  git branch -m main
  git remote add origin {{cookiecutter.gitops_repo}}
}

pre_commit_install() {
  echo "Installing pre-commit hooks"
  pre-commit install
}

transcrypt_init() {
  echo "Initializing transcrypt"
  transcrypt -c aes-256-cbc -p "$(pwgen 30 1)" --yes
  echo "{{cookiecutter.cluster_name}}/terraform/deploy/secrets/* filter=crypt diff=crypt merge=crypt" >> .gitattributes
  transcrypt --display
}

generate_ssh_key() {
  echo "Generating gitops ssh key"
  mkdir ssh
  ssh-keygen -b 2048 -t rsa -C "gitops key" -f "ssh/sshPrivateKey" -N "" > /dev/null
}

create_gitops_secret() {
  echo "Generating gitops secret..."
  kubectl create secret generic gitops --from-file ssh/sshPrivateKey \
  --from-literal=url={{cookiecutter.gitops_repo}} \
  -n argo-cd \
  --dry-run=client -o yaml > {{cookiecutter.cluster_name}}/terraform/deploy/secrets/gitops.yaml
  rm -f {{cookiecutter.cluster_name}}/terraform/deploy/secrets/.gitkeep
  echo "Appending required annotations..."
  yq -i '.metadata.labels."argocd.argoproj.io/secret-type" = "repo-creds"' {{cookiecutter.cluster_name}}/terraform/deploy/secrets/gitops.yaml
}

main() {
  git_init
  pre_commit_install
  transcrypt_init
  generate_ssh_key
  create_gitops_secret
  direnv allow && echo .envrc >> .gitignore
}

main
