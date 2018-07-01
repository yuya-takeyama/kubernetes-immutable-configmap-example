#!/bin/bash
pod_name=$(kubectl get pods -n cm-deploy-immutable -o json | jq '.items[0].metadata.name' -r)
kubectl exec -it "${pod_name}" -n cm-deploy-immutable -- ash -c 'echo $APP_VERSION'
