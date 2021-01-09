FROM golang:alpine

WORKDIR /go/src/app

COPY go.mod .
COPY go.sum .

RUN go mod download
RUN go mod verify

COPY . .

RUN go build -o build/web-app

CMD ["./build/web-app"]