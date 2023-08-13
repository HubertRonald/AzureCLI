FROM mcr.microsoft.com/azure-cli:2.8.0

SHELL ["/bin/bash", "-c"]

ARG EXTENSIONS
ENV AZExtensions=$EXTENSIONS

RUN mkdir -p /home/data \
 && IFS=',' read -a services <<< "$AZExtensions" \
 && for service in ${services[@]}; do az extension add --name ${service}; done