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
    nginx \
    vim

ADD nginx.conf /etc/nginx/sites-available/app.conf

RUN mkdir /GCBGB
ENV APP_ROOT /GCBGB
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT
RUN mkdir tmp/sockets

CMD bundle exec puma -d && \
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf