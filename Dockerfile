FROM golang:latest
RUN apt update && apt install -y \
git
RUN git clone https://github.com/dgrijalva/jwt-go.git /go/src/github.com/dgrijalva
ADD . /go
ADD config /usr/local/go/src/github.com/thewhitetulip/Tasks/config
ADD views /usr/local/go/src/github.com/thewhitetulip/Tasks/
ADD utils /usr/local/go/src/github.com/thewhitetulip/Tasks/
ADD types /usr/local/go/src/github.com/thewhitetulip/Tasks/
ADD sessions /usr/local/go/src/github.com/thewhitetulip/Tasks/
ADD db /usr/local/go/src/github.com/thewhitetulip/Tasks/
WORKDIR /go
#RUN go build
RUN go install
RUN cat schema.sql | sqlite3 tasks.db
