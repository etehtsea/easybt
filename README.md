# easyBt
[![Build Status](https://secure.travis-ci.org/etehtsea/easybt.png)](http://travis-ci.org/etehtsea/easybt)

This app is aimed to be light frontend to any bittorrent tracker.
At the moment it is in pre-alpha stage so don't expect much from it.

## Installation and configuration

### Requirements

* [Ruby 1.9.2](http://ruby-lang.org/)
* [mongoDB](http://www.mongodb.org/)
* BitTorrent tracker (like [opentracker](http://erdgeist.org/arts/software/opentracker/))

### Install

```sh
$ git clone https://github.com/etehtsea/easybt.git
$ bundle install
$ cp config/app_config.yml.example config/app_config.yml
$ rails s thin
```
### Configuration
You can configure your app in `app_config.yml`

## Documentation

[Specs](https://github.com/etehtsea/easybt/tree/master/spec)
are the only documentation at the moment.

## Running Tests

You can use [guard](https://github.com/guard/guard) to run tests continuously

```sh
$ guard start
```

or just usual [rake](https://github.com/jimweirich/rake) task run them once

```sh
$ rake spec
```

## Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2010 Konstantin Shabanov. See LICENSE for
further details.
