FROM golang:latest
ADD . /go
ADD config /usr/local/go/src/github.com/thewhitetulip/Tasks/config
ADD views /usr/local/go/src/github.com/thewhitetulip/Tasks/views
RUN go build
RUN cat schema.sql | sqlite3 tasks.db
