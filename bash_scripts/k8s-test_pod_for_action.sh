#!/bin/bash

appPod=$(kubectl get pods -n default -l app=hello-world --output=jsonpath={.items..metadata.name})

kubectl port-forward $appPod 3000:3000 &

sleep 10

curl -s 0.0.0.0:3000
