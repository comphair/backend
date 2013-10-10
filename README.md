salon-backend [![Build Status](https://travis-ci.org/comphair/backend.png?branch=master)](https://travis-ci.org/comphair/backend)
=============

## Install
```sh
$ bundle
$ rake db:reset
```

## Server
```sh
$ sidekiq -r ./env.rb
$ rackup # or
$ rerun rackup
```

## Testing
```sh
$ rake db:reset ENV=testing
$ rspec # or
$ guard
```

## Tools
* [Brew](http://brew.sh/)
* [rbenv](https://github.com/sstephenson/rbenv)
* [Redis](http://redis.io/)
* [PostgreSQL](http://postgresapp.com/)

## Global gems
```sh
$ gem install bundler
```
