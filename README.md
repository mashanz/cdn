# Serve folder like CDN

## Installation

```sh
cargo install cdn
```

## Run

```
cdn
# Static will be served at 0.0.0.0:8080
```

## Using it with docker

Docker is based on distroless/cc-debian12

```Dockerfile
FROM ghcr.io/mashanz/cdn:latest AS runner
WORKDIR /static
COPY . .
ENTRYPOINT ["cdn"]
```
