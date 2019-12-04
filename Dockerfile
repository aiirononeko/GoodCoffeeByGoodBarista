FROM ruby:2.5.3-alpine3.8

RUN apk update && \
    apk add --no-cache alpine-sdk \
    nodejs-current \
    nodejs-npm \
    yarn \
    mysql-client \
    mysql-dev \
    python2 \
    tzdata \
    vim

RUN mkdir /usr/src/GCBGB
ENV APP_ROOT /usr/src/GCBGB
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT
RUN mkdir -p tmp/sockets

VOLUME /GCBGB/public
VOLUME /GCBGB/tmp

CMD bundle exec puma
