.PHONY: tfs init apply

.DEFAULT_GOAL := apply

tfs:
	@tfswitch

init: tfs
	@terraform init

apply: tfs
	@terraform apply
