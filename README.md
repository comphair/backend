salon-backend
=============

## Install
```sh
$ bundle
$ rake db:reset
```

## Server
```sh
$ sidekiq -r sidekiq.rb
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
