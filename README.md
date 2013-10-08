# EventGirlClient [![Code Climate](https://codeclimate.com/github/Absolventa/event_girl_client.png)](https://codeclimate.com/github/Absolventa/event_girl_client) [![Build Status](https://travis-ci.org/Absolventa/event_girl_client.png?branch=master)](https://travis-ci.org/Absolventa/event_girl_client) [![Gem Version](https://badge.fury.io/rb/event_girl_client.png)](http://badge.fury.io/rb/event_girl_client)

EventGirlClient can be used in your own app to send
events to an external Event Girl Application such as 
[event-girl.herokuapp.com](event-girl.herokuapp.com).
It is the gem for [Event Girl](https://github.com/Absolventa/event_girl)
which was part of a project
for the [Rails Girls Summer of Code](http://railsgirlssummerofcode.org).
Its three main contributors are the 
Rails Girls Susanne and Tam, and their coach Carsten, who worked on the project 
from July 2 - September 30, 2013 at the [ABSOLVENTA](http://www.absolventa.de)
offices in Berlin.

Using an initializer file for Rails, you can do:

    EventGirl::Client.configure do |config|
      config.api_token = 'my-api-token'
      config.url = 'http://my-eventgirl-endpoint.example.com'
    end

The gem also includes a command line executable. See ``event_girl -h`` for further details.

## Installation

Add this line to your application's Gemfile:

    gem 'event_girl_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install event_girl_client

## Usage

Get the URL you want to send the event to (example: www.event-girl.herokuapp.com/incoming_events)

Create a remote side and get its API token via the Event Girl application.

Create an instance and start sending events:

    client = EventGirl::Client.new('http://example.com', 'mytoken')
    client.send! 'hello from event girl client'

You can optionally send additional payload data:

    client = EventGirl::Client.new('http://example.com', 'mytoken')
    client.send! 'hello from event girl client', 'Optional additional data that will not be matched'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
