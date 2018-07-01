#!/bin/bash
config_checksum=$(shasum immutable/nginx-config.cm.yaml.tpl | awk '{ print $1 }')

kubectl apply --record -n cm-deploy-immutable \
  -f immutable/cm-deploy-immutable.ns.yaml \
  -f <(cat immutable/nginx-config.cm.yaml.tpl | config_checksum=$config_checksum envsubst '$config_checksum') \
  -f <(cat immutable/nginx.deploy.yaml.tpl | config_checksum=$config_checksum envsubst '$config_checksum')
