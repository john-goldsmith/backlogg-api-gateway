FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /backlogg/backlogg-api-gateway
WORKDIR /backlogg/backlogg-api-gateway
COPY . ./
RUN gem install bundler --no-document
RUN bundle install
EXPOSE 3000
# ENTRYPOINT ["bundle", "exec"]
ENTRYPOINT ["./docker-entry.sh"]
CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]