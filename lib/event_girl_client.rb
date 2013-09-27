require 'net/http'
require 'uri'
require 'active_support/core_ext/class'

require 'rubygems'

module EventGirl
  class Client

    VERSION = '0.1.0'

    cattr_accessor :api_token, :url
    attr_reader :api_token, :url

    def initialize(url, api_token)
      @url = url.to_s
      @api_token = api_token.to_s
    end

    def send_event(title)
      uri = URI.parse(url)

      # This is all the post request stuff.
      req = Net::HTTP::Post.new(uri.path)

      # The request format and content type is json
      req['Accept']       = "application/json"
      req['Content-Type'] = "application/json"

      # This takes the entered api token and title. This is what is sent. It is a HASH!
      req.body = '{"api_token":"' + api_token + '","incoming_event":{"title":"' + title.to_s + '"}}'

      # The request is sent via HTTP to the host and port. You also get a response
      # ex: 201 (it worked)
      Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }
    end

    def self.configure
      yield self if block_given?
    end
  end
end
