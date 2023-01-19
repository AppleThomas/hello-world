# Hello World Rust App

A simple Rust-based "hello world" webserver application.

## Build

```shell
cargo build
```

## Lint

```shell
cargo fmt --all -- --check
cargo clippy
```

## Test

```shell
cargo test
```

## Run

After building, the server binary will be runnable from either of the following locations depending on the build mode:

### Debug build
```shell
./target/debug/hello-world
```

### Release build
```shell
# release build
./target/release/hello-world
```

Output:
```shell
2023-01-13T00:35:49.193122Z  INFO hello_world: listening on 0.0.0.0:3000
```

## Docker Build

[Docker Hub repo](https://hub.docker.com/r/joeleav/hello-world)

### Build, Tag, and Test all in one script
```shell
bash bash_scripts/docker-build_and_test.sh
```

Output:
```shell
Building Image:
...
...

Running Container:
fb15d14d1e6536b8edb3e68fead3b2914919239bd9a6f1406eed8571151d8b60

Making Request:
Hello, World!
```

### Kill and remove unused containers

You have to execute these commands to run the kubernetes deployment and test_pod.sh script. Otherwise you might get a conflict on port 3000.

```shell
docker kill $(docker ps -q --filter ancestor=joeleav/hello-world:0.1.0)
```
```shell
docker container prune
```
Press **y** to remove unused containers

## Deploy to docker-desktop kubernetes

Make sure you have Docker Desktop installed with Kubernetes enabled.

### Deploy K8s Manifests

This script accepts an optional argument to provide an image tag. If an image tag isn't provided it defaults to 'latest':
```shell
bash bash_scripts/k8s-deployment.sh [IMAGE_TAG]
```

The only image tags on dockerhub for this project are '0.1.0' and 'latest'. This example deploys with '0.1.0':
```shell
bash bash_scripts/k8s-deployment.sh 0.1.0
```

Output:
```shell
IMAGE_TAG IS 0.1.0
deployment.apps/hello-world created
service/hello-world created
pod/hello-world-fd5fb64d9-sg9mk condition met
```

### Test Pod

Port-forward as background process then make a request to the hello-world app:
```shell
bash bash_scripts/test_pod.sh
```

Output:
```shell
Forwarding from 127.0.0.1:3000 -> 3000
Forwarding from [::1]:3000 -> 3000
Handling connection for 3000
Hello, World!
```

### Removal
Go to your Docker Desktop application > Settings > Kubernetes > Click 'Reset Kubernetes Cluster'.
