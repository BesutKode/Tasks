FROM golang:latest
RUN apt update && apt install -y \
git
RUN git clone https://github.com/gorilla/sessions.git /go/src/github.com/gorilla/sessions
RUN git clone https://github.com/dgrijalva/jwt-go.git /go/src/github.com/dgrijalva/jwt-go
RUN git clone https://github.com/mattn/go-sqlite3 /go/src/github.com/mattn/go-sqlite3
RUN git clone https://github.com/shurcooL/github_flavored_markdown.git /go/src/github.com/shurcooL/github_flavored_markdown
RUN git clone https://github.com/gorilla/securecookie.git /go/src/github.com/gorilla/securecookie
RUN git clone https://github.com/microcosm-cc/bluemonday.git /go/src/github.com/microcosm-cc/bluemonday
RUN git clone https://github.com/russross/blackfriday.git /go/src/github.com/russross/blackfriday
RUN git clone https://github.com/shurcooL/highlight_diff.git /go/src/github.com/shurcooL/highlight_diff
RUN git clone https://github.com/shurcooL/highlight_go.git /go/src/github.com/shurcooL/highlight_go
RUN git clone https://github.com/shurcooL/octiconssvg.git /go/src/github.com/shurcooL/octiconssvg
RUN git clone https://github.com/shurcooL/sanitized_anchor_name.git /go/src/github.com/shurcooL/sanitized_anchor_name
RUN git clone https://github.com/sourcegraph/annotate.git /go/src/github.com/sourcegraph/annotate
RUN git clone https://github.com/sourcegraph/syntaxhighlight.git /go/src/github.com/sourcegraph/syntaxhighlight
RUN git clone https://github.com/golang/net.git net
ADD net/html/ /go/src/golang.com/x/net/html/
RUN git clone https://github.com/sergi/go-diff.git /go/src/github.com/sergi/go-diff/
RUN git clone https://github.com/gorilla/context.git /go/src/github.com/gorilla/context/
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
