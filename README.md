# Ereignishorizont Client [![Code Climate](https://codeclimate.com/github/Absolventa/ereignishorizont-client.png)](https://codeclimate.com/github/Absolventa/ereignishorizont-client) [![Build Status](https://travis-ci.org/Absolventa/ereignishorizont-client.png?branch=master)](https://travis-ci.org/Absolventa/ereignishorizont-client) [![Gem Version](https://badge.fury.io/rb/ereignishorizont.png)](http://badge.fury.io/rb/ereignishorizont)

Ereignishorizont Client can be used in your own app to send
events to an external Ereignishorizont Application such as
[ereignishorizont.herokuapp.com](https://ereignishorizont.herokuapp.com).
It is the gem for [Ereignishorizont](https://github.com/Absolventa/ereignishorizont)
(formerly known as 'Event Girl') which was part of a project
for the [Rails Girls Summer of Code](http://railsgirlssummerofcode.org).
Its three main contributors are the
Rails Girls Susanne and Tam, and their coach Carsten, who worked on the project
from July 2 - September 30, 2013 at the [ABSOLVENTA](https://www.absolventa.de)
offices in Berlin.

Using an initializer file for Rails, you can do:

    Ereignishorizont::Client.configure do |config|
      config.api_token = 'my-api-token'
      config.url = 'http://my-ereignishorizont-endpoint.example.com'
    end

The gem also includes a command line executable. See ``ereignishorizont -h`` for further details.

## Installation

Add this line to your application's Gemfile:

    gem 'ereignishorizont-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ereignishorizont-client

## Usage

Get the URL you want to send the event to (example: https://ereignishorizont.herokuapp.com/incoming_events)

Create a remote side and get its API token via the Ereignishorizont application.

Create an instance and start sending events:

    client = Ereignishorizont::Client.new('http://example.com', 'mytoken')
    client.send! 'hello from ereignishorizont-client'

You can optionally send additional payload data:

    client = Ereignishorizont::Client.new('http://example.com', 'mytoken')
    client.send! 'hello from ereignishorizont-client', 'Optional additional data that will not be matched'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
