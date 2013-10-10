comphair backend [![Build Status](https://travis-ci.org/comphair/backend.png?branch=master)](https://travis-ci.org/comphair/backend) [![Code Climate](https://codeclimate.com/repos/52570a4813d63740d20010b5/badges/826fb9dd696ea94a96fd/gpa.png)](https://codeclimate.com/repos/52570a4813d63740d20010b5/feed) [![Coverage Status](https://coveralls.io/repos/comphair/backend/badge.png)](https://coveralls.io/r/comphair/backend)
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
