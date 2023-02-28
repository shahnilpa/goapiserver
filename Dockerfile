FROM golang:latest

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN go build -o main .

RUN useradd -d /home/app -m -s /bin/bash gotest

USER gotest

EXPOSE 8080
CMD [ "/app/main" ]

