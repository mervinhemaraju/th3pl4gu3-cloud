#!/bin/zsh

# * Perform a terraform format check
terraform fmt -check

# * Perform a terraform validate
terraform validate

# * Run pre-commit
pre-commit run -a