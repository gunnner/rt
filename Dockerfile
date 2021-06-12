FROM ruby:3.0.1
RUN apt-get update && apt-get install -qq -y build-essential git nodejs libpq-dev cmake libgit2-dev pkg-config --fix-missing --no-install-recommends

RUN mkdir /app
WORKDIR /app

RUN gem install bundler --no-document
RUN bundle config git.allow_insecure true

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install
