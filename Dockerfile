FROM ruby:2.3


ENV APP_HOME /code
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
ADD . $APP_HOME
RUN rm -r $APP_HOME/test

EXPOSE 3000

RUN bundle install --without development  --path vendor/bundle
RUN rake assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
