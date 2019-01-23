FROM alpine:latest

## The action name displayed by GitHub
LABEL "com.github.actions.name"="kubectl deploy"
## The description for the action
LABEL "com.github.actions.description"="Deploy the kubernetes change to apply."
## https://developer.github.com/actions/creating-github-actions/creating-a-docker-container/#supported-feather-icons
LABEL "com.github.actions.icon"="check"
## The color of the action icon
LABEL "com.github.actions.color"="green"

RUN     apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        git \
        jq

RUN curl -L -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl && \
  chmod +x /usr/bin/kubectl && \
  kubectl version --client

COPY deploy /usr/bin/deploy
CMD ["deploy"]