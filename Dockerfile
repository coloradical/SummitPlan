FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /SummitPlan
WORKDIR /SummitPlan
ADD Gemfile /SummitPlan/Gemfile
ADD Gemfile.lock /SummitPlan/Gemfile.lock
RUN bundle install
ADD . /SummitPlan
