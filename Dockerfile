FROM ruby:2.7.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

RUN mkdir /rails_project
WORKDIR /rails_project

RUN mkdir /public2
ADD Gemfile /rails_project/Gemfile
ADD Gemfile.lock /rails_project/Gemfile.lock

RUN bundle install

ADD . /rails_project

RUN mkdir -p tmp/sockets