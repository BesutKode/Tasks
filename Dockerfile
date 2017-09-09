FROM golang:latest
RUN go build
RUN cat schema.sql | sqlite3 tasks.db
