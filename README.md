# Description

## Prerequisites

- azure cli installed
- login on azure cli

## IAC - azure resources

Update the dev.tfvars with the prefix the resources will have and the location where the resources will be created.

```sh
cd iac

terrraform init

terraform plan -out plan1

terraform apply plan1
```


## Test - use the model endpoint

Update the .env variables, the required values were displayed after applying the terraform plan

```sh
cd test

uv sync

uv run main.py

```