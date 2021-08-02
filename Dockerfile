FROM hashicorp/tfc-agent:latest

USER root

ARG AWS_CLI_VERSION=2.0.60

# get `wget` & software-properties-common
RUN apt-get update
RUN apt-get install -y unzip curl

# Get AWS CLI
# https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html#install-linux-awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    rm -rf ./aws