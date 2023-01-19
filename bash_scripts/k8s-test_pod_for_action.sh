#!/bin/bash

appPod=$(kubectl get pods -n default -l app=hello-world --output=jsonpath={.items..metadata.name})

kubectl port-forward $appPod 45287:3000 &

sleep 30

curl -v localhost:45287

echo "done"
#curl -v 172.18.0.2:30007
