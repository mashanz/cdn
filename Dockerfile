FROM docker.io/rust:bookworm as build
WORKDIR /app
COPY . .
RUN cargo b -r
FROM gcr.io/distroless/cc-debian12
COPY --from=build /app/target/release/cdn /bin/cdn
CMD ["cdn"]
