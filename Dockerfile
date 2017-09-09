FROM golang:latest
ADD . /go
RUN go build
RUN cat schema.sql | sqlite3 tasks.db
