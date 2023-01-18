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

