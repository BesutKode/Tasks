FROM golang:latest
ADD . /go
RUN ls /usr/local/go/src/github.com/thewhitetulip/Tasks/config
RUN go build
RUN cat schema.sql | sqlite3 tasks.db
