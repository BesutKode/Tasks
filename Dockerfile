FROM golang:latest
RUN apt update && apt install -y \
git
RUN git clone https://github.com/gorilla/sessions.git /go/src/github.com/gorilla/sessions
RUN git clone https://github.com/dgrijalva/jwt-go.git /go/src/github.com/dgrijalva/jwt-go
RUN git clone https://github.com/mattn/go-sqlite3 /go/src/github.com/mattn/go-sqlite3
RUN git clone https://github.com/shurcooL/github_flavored_markdown.git /go/src/github.com/shurcooL/github_flavored_markdown
ADD . /go
ADD config /go/src/github.com/thewhitetulip/Tasks/config
ADD views /go/src/github.com/thewhitetulip/Tasks/views
ADD utils /go/src/github.com/thewhitetulip/Tasks/utils
ADD types /go/src/github.com/thewhitetulip/Tasks/types
ADD sessions /go/src/github.com/thewhitetulip/Tasks/sessions 
ADD db /go/src/github.com/thewhitetulip/Tasks/db
WORKDIR /go
#RUN go build
RUN go install
RUN cat schema.sql | sqlite3 tasks.db
