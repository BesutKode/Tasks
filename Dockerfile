FROM golang:latest
ENV TASKS_DIR /usr/local/go/src/github.com/thewhitetulip/Tasks/
RUN apt update && apt install -y \
git
RUN git clone https://github.com/dgrijalva/jwt-go.git /go/src/github.com/dgrijalva
ADD . /go
ADD config $TASKS_DIR
ADD views $TASKS_DIR
ADD utils $TASKS_DIR
ADD types $TASKS_DIR
ADD sessions $TASKS_DIR
ADD db $TASKS_DIR
WORKDIR /go
RUN go build
RUN cat schema.sql | sqlite3 tasks.db
