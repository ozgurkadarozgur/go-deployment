FROM golang:alpine

WORKDIR /go/src/app

COPY go.mod .
COPY go.sum .

RUN go mod download
RUN go mod verify

COPY . .

RUN go build -o build/web-app

EXPOSE 8080

CMD ["./build/web-app"]