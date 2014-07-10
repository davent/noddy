# Noddy

Noddy Logger is a very simple library to quickly outputs from your scripts and applications.

This is very much a work in progress, but is still usable.

TODO:

 - Specify log output e.g. STDERR, STDOUT, File
 - Sepcifiy log format

## Installation

Add this line to your application's Gemfile:

    gem 'noddy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install noddy

## Usage

```ruby
require "noddy"

Noddy.log_level = Noddy::DEBUG # Default: Noddy::INFO
Noddy.colour = true # Default: false
Noddy.timestamp = false # Default: true

Noddy.debug "I am just a debug message"
Noddy.info "I am an info message"
Noddy.warning "I am a warning message"
Noddy.error "I am am error message"
Noddy.critical "Oh dear, I am a critical message"
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/noddy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
