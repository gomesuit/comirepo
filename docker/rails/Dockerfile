FROM node:8.5.0-alpine as node

FROM ruby:2.4.1-alpine3.6

RUN apk add --update --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del --purge tzdata

EXPOSE 3000

RUN apk --update --no-cache add shadow
RUN useradd rails -u 3333 -d /home/rails && \
    mkdir -p /home/rails/app && \
    chown rails.rails -R /home/rails
#USER rails
WORKDIR /home/rails/app

# install nodejs yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/include/node /usr/local/include/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /opt/yarn /opt/yarn
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn

# install dependency package
# mariadb-dev for mysql
# execline for exec
RUN apk --update --no-cache add mariadb-dev tzdata execline

# bundle install
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    apk --update --no-cache add mariadb-dev tzdata && \
    apk --update --no-cache --virtual gem-builddeps add alpine-sdk && \
    bundle install --jobs=4 --without development test --path vendor/bundle && \
    apk del --purge gem-builddeps
# COPY --from=gem-builder /home/rails/app/vendor/bundle vendor/bundle
# COPY --from=gem-builder /usr/local/bundle /usr/local/bundle

# yarn install
COPY package.json yarn.lock .postcssrc.yml ./
RUN yarn install

# assets precompile
COPY Rakefile .babelrc ./
COPY bin bin
COPY config config
COPY app app
RUN DOCKER_BUILD=true RAILS_ENV=production bin/rails assets:precompile

COPY . /home/rails/app
RUN mkdir -p tmp/uploads && \
    chown rails.rails . * db/schema.rb && \
    chown rails.rails -R log tmp
USER rails

ENTRYPOINT ["docker/rails/entrypoint.sh"]

CMD exec bundle exec puma -t "$PUMA_THREADS":"$PUMA_THREADS" -p 3000 -e "$RAILS_ENV" -C config/puma.rb
