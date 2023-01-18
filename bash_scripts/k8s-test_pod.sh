#!/bin/bash

appPod=$(kubectl get pods -l app=hello-world --output=jsonpath={.items..metadata.name})

kubectl port-forward $appPod 3000:3000 &

curl localhost:3000
