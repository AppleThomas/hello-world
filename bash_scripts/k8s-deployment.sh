#!/bin/bash

if [ -z "$1" ]
then
  echo "\$1 IS EMPTY"
  arg1=${1:-"latest"}
  set -- "${arg1}"
  unset arg1
  echo 'IMAGE_TAG IS '"$1"''
else
  echo 'IMAGE_TAG IS '"$1"''
fi

sed -i 's/%IMAGE_TAG%/'"$1"'/g' k8s/manifests/hello-world-deployment.yaml

kubectl apply -f k8s/manifests/
kubectl wait pods -n default -l app=hello-world --for condition=Ready --timeout=60s

sed -i 's/'"$1"'/%IMAGE_TAG%/g' k8s/manifests/hello-world-deployment.yaml
