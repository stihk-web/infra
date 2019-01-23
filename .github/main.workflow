## Workflow defines what we want to call a set of actions.

## For every new push check if the changes can be applied to kubernetes ## using the action called: kubectl dryrun
workflow "after a push check if they apply to kubernetes" {
  on = "push"
  resolves = ["kubectl dryrun"]
}

## When a PR is merged trigger the action: kubectl deploy. To apply the new code to master.
workflow "on merge to master deploy on kubernetes" {
  on = "pull_request"
  resolves = ["kubectl deploy"]
}

## This is the action that checks if the push can be applied to kubernetes
action "kubectl dryrun" {
  uses = "./.github/actions/dryrun"
  secrets = ["KUBECONFIG"]
}

## This is the action that applies the change to kubernetes
action "kubectl deploy" {
  uses = "./.github/actions/deploy"
  secrets = ["KUBECONFIG"]
}