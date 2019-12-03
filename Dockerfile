FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       ssmtp \
                       vim

RUN mkdir /GCBGB
ENV APP_ROOT /GCBGB
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT
RUN mkdir -p tmp/sockets

# Expose volumes to frontend
VOLUME /GCBGB/public
VOLUME /GCBGB/tmp

# Start Server
# TODO: environment
CMD bundle exec puma
