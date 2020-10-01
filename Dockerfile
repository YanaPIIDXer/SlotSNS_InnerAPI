FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
    libpq-dev \
    nodejs

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT

EXPOSE 3000
CMD ["rails", "s", "-p", "3000", "-b", "0.0.0.0"]
