FROM ruby:slim

COPY . /app/
WORKDIR /app
RUN ./test.sh

CMD ["./run.sh"]
