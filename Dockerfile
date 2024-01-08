# Usa golang alpine para buildar
FROM golang:alpine AS builder

WORKDIR /usr/app

COPY . .

RUN go build ./hello.go

FROM scratch

WORKDIR /usr/app

COPY --from=builder /usr/app/hello .

CMD ["./hello"]