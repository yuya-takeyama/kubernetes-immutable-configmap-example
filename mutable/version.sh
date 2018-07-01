#!/bin/bash
pod_name=$(kubectl get pods -n cm-deploy-mutable -o json | jq '.items[0].metadata.name' -r)
kubectl exec -it "${pod_name}" -n cm-deploy-mutable -- ash -c 'echo $APP_VERSION'
