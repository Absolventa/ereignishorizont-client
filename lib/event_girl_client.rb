require 'net/http'
require "uri"

require 'rubygems'
require 'json'

module EventGirl
  class Client

    VERSION = '0.0.1'

    attr_reader :api_token, :url

    def initialize(url, api_token)
      @url = url
      @api_token = api_token
    end

    def send_event(title)

      # The uri takes a url and splits it up into a path (/incoming_events),
      # a host (localhost) and a port (3000) which are used in the req and the response
      # This is necessary so that a user only has to enter the 3 parameters with
      # the sent_event call.
      uri = URI(url)

      # This is all the post request stuff.
      req = Net::HTTP::Post.new(uri.path)

      # The content type is json
      req.content_type = "application/json"

      # This takes the entered api token and title. This is what is sent. It is a HASH!
      req.body = <<-EOJSON
      {"api_token":"#{api_token}","incoming_event":{"title":"#{title}"}}
      EOJSON

      # The request is sent via HTTP to the host and port. You also get a response
      # ex: 201 (it worked)
      Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }
    end
  end
end
