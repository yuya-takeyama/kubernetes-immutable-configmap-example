apiVersion: v1
data:
  APP_VERSION: "2"
kind: ConfigMap
metadata:
  name: nginx-config-${config_checksum}
  namespace: cm-deploy-immutable
