FROM golang:latest
RUN go bulid
RUN cat schema.sql | sqlite3 tasks.db
RUN echo "tolong docker - jalanlah"
