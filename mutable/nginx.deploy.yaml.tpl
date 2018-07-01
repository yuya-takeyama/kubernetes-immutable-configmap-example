apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: nginx
  namespace: cm-deploy-mutable
spec:
  replicas: 1
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
      annotations:
        yuyat.jp/configmap.checksum.nginx-config: "${config_checksum}"
    spec:
      containers:
      - envFrom:
        - configMapRef:
            name: nginx-config
        image: nginx:alpine
        name: nginx
