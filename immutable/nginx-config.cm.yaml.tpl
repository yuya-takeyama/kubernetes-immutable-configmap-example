apiVersion: v1
data:
  APP_VERSION: "1"
kind: ConfigMap
metadata:
  name: nginx-config-${config_checksum}
  namespace: cm-deploy-immutable
