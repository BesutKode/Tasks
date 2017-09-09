FROM golang:latest
RUN apt update && apt install -y \
git
RUN git clone https://github.com/gorilla/sessions.git /go/src/github.com/gorilla/sessions
RUN git clone https://github.com/dgrijalva/jwt-go.git /go/src/github.com/dgrijalva/jwt-go
ADD . /go
ADD config /go/src/github.com/thewhitetulip/Tasks/config
ADD views /go/src/github.com/thewhitetulip/Tasks/views
ADD utils /go/src/github.com/thewhitetulip/Tasks/utils
ADD types /go/src/github.com/thewhitetulip/Tasks/types
ADD sessions /src/github.com/thewhitetulip/Tasks/sessions 
ADD db /go/src/github.com/thewhitetulip/Tasks/db
WORKDIR /go
#RUN go build
RUN go install
RUN cat schema.sql | sqlite3 tasks.db
