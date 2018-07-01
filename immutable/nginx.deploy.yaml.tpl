apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: nginx
  namespace: cm-deploy-immutable
spec:
  replicas: 3
  selector:
    matchLabels:
      run: nginx
  template:
    metadata:
      labels:
        run: nginx
    spec:
      containers:
      - envFrom:
        - configMapRef:
            name: "nginx-config-${config_checksum}"
        image: nginx:alpine
        name: nginx
