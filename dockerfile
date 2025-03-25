FROM golang:1.21.1 AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

# Build a static binary (important!)
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o bin/main ./src/main.go

# Final image
FROM gcr.io/distroless/base-debian11

WORKDIR /app

COPY --from=builder /app/bin/main .

CMD ["/app/main"]