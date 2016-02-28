FROM ruby:2.2
MAINTAINER malecki.artur.84@gmail.com

ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/

WORKDIR /tmp
RUN bundle install

ADD . /var/www/app

WORKDIR /var/www/app

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s"]
