# First Stage
FROM rust:1.66.1 as build

WORKDIR /app

COPY ./src ./src
COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock


RUN cargo build --release

# Second Stage
FROM debian:buster-slim

EXPOSE 3000

COPY --from=build /app/target/release/hello-world .
#COPY --from=build /app/target/debug/hello-world .

CMD ["./hello-world"]
