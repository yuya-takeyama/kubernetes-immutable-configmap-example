#!/bin/bash
config_checksum=$(shasum mutable/nginx-config.cm.yaml | awk '{ print $1 }')

kubectl apply --record -n cm-deploy-mutable \
  -f mutable/cm-deploy-mutable.ns.yaml \
  -f mutable/nginx-config.cm.yaml \
  -f <(cat mutable/nginx.deploy.yaml.tpl | config_checksum=$config_checksum envsubst '$config_checksum')
