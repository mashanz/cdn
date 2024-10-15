FROM docker.io/rust:bookworm as build
WORKDIR /app
COPY . .
RUN cargo b -r --target=x86_64-unknown-linux-gnu
FROM gcr.io/distroless/static-debian12
COPY --from=build /app/target/x86_64-unknown-linux-gnu/release/cdn /bin/cdn
EXPOSE 8080
CMD ["cdn"]
