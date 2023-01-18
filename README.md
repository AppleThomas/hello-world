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

### Kill and remove unused containers
```shell
docker kill $(docker ps -q --filter ancestor=joeleav/hello-world:0.1.0)
```
```shell
docker container prune
```
Press y if you wish to remove unused containers

## Deploy to docker-desktop kubernetes

Make sure you have Docker Desktop installed with Kubernetes enabled

```shell
bash bash_scripts/k8s-deployment.sh
```
## Test Pod

Port-Forward:
```shell
bash bash_scripts/test_pod.sh
```

Open a new terminal window and make a request:
```shell
curl localhost:3000
```


