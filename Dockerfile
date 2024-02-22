FROM golang:1.21

WORKDIR /app

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on

COPY go.mod ./
RUN go mod download

RUN go get github.com/ericthomasca/sudoku-go/sudoku

COPY *.go ./

RUN go build -o /sudoku-go

EXPOSE 8976

CMD ["/sudoku-go"]