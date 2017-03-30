# Codeship Pro, Terraform Example

This sample repository details the steps necessary to get started with [terraform](https://terraform.io) on Codeship Pro.

**It is in experimental state right now and might not work for every setup.**

## Terraform Configuration

The repository contains a very basic terraform configuration. It is configured with remote state and state locking based on AWS S3 and AWS DynamoDB. The configuration itself takes care of configuring the remote state backend (via the `00_terraform.tf` file) as well as configuring the required ressources on AWS (via the `01_aws.tf` file).

All required credentials are provided via environment variables, see the `env.example` file for a sample version).

## Codeship Pro Configuration

The repository contains a simple `Dockerfile` based on the [hashicorp/terraform:light](https://hub.docker.com/r/hashicorp/terraform) image. It configures a working directory and copies all required files into the Docker image.

The `codeship-services.yml` configures a service based on that image. It additionally mounts the `./tmp` directory into the container to allow steps to share data (mainly required for sharing the computed `tfplan` file from the `plan` step to the `apply` step). It also configures the container to use an encrypted environment file (defaulting to `env.encrypted`) to provide the container with access to AWS.

The `codeship-steps.yml` configures the following 4 steps

1. `version`: which simply prints the current terraform version information
2. `init`: required to initizalize the remote state backend
3. `plan`: to compute a terraform plan of any required changes. The generated plan is shared with the `apply` step via a volume to ensure that only those changes are made.
4. `apply`: (limited to the `master` branch) to actually make the requested changes. This step reuses the plan computed in step 3

Please see the [terraform documentation]() for more information on the individual commands, their usage and available options.
