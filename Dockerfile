FROM ruby:2.7.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

RUN mkdir /rails_vue_portfolio
WORKDIR /rails_vue_portfolio

ADD Gemfile /rails_vue_portfolio/Gemfile
ADD Gemfile.lock /rails_vue_portfolio/Gemfile.lock

RUN bundle install

ADD . /rails_vue_portfolio

RUN mkdir -p tmp/sockets