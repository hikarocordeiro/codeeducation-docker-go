FROM golang:1.15 AS builder
WORKDIR /go/src/codeeducation
COPY . .
RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch
WORKDIR /go/src/codeeducation
COPY --from=builder /go/src/codeeducation/codeeducation .

ENTRYPOINT ["./codeeducation"]


