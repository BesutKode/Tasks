FROM golang:latest
RUN apt update && apt install -y \
git
RUN git clone https://github.com/dgrijalva/jwt-go.git /usr/local/go/src/github.com/github.com/dgrijalva/jwt-go
ADD . /go
ADD config /usr/local/go/src/github.com/thewhitetulip/Tasks/config
ADD views /usr/local/go/src/github.com/thewhitetulip/Tasks/views
WORKDIR /go
RUN go build
RUN cat schema.sql | sqlite3 tasks.db
