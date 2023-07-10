FROM golang:1.20.5-alpine AS builder
RUN mkdir /build
ADD go.mod hello.go /build/
WORKDIR /build
RUN go build

FROM scratch
COPY --from=builder /build/hello /app/
WORKDIR /app
CMD ["./hello"]