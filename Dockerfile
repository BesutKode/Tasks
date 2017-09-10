FROM golang:1.8-jessie
MAINTAINER Mochammad Nur Afandi (localanu@gmail.com)
ENV PORT_T 8081
RUN apt update && apt install -y sqlite3

WORKDIR /go/src/app
COPY . .
RUN go-wrapper download 
RUN go-wrapper install 
RUN sed -i 's/ANU/$PORT_T/g' config.json
RUN sqlite3 tasks.db < schema.sql

CMD ["go-wrapper", "run"] 
