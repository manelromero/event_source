FROM ruby:3.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["ruby", "sse_server.rb"]
