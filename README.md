# Capistrano::Releases::Notification

[![Gem Version](https://badge.fury.io/rb/capistrano-releases-notification.svg)](https://badge.fury.io/rb/capistrano-releases-notification)

Notify github releases to slack for Capistrano ver3.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-releases-notification'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-releases-notification

## Usage

### Capfile

```
require 'capistrano/github/releases'       # dependency
require 'capistrano/slack_notification'    # dependency
require 'capistrano/releases/notification'
```

### config/deploy.rb

```
set :release_notify_channel, ['#general']
set :release_notify_mention, []

after 'deploy:finishing', 'release:notify'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/capistrano-releases-notification. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## Author

* [kimromi](https://github.com/kimromi)

## Thanks

* [linyows](https://github.com/linyows)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

