FROM ruby:2.7.2

WORKDIR /app

COPY . /app

RUN make provision

CMD [ "tail", "-f", "/dev/null" ]
