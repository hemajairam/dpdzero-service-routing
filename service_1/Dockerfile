FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod init service1 && go mod tidy
RUN go build -o service1

FROM alpine
WORKDIR /app
COPY --from=builder /app/service1 .
EXPOSE 8001
CMD ["./service1"]
