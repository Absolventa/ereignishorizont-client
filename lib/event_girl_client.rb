require 'net/http'
require 'uri'

require 'rubygems'

module EventGirl
  class Client

    VERSION = '0.0.1'

    attr_reader :api_token, :url

    def initialize(url, api_token)
      @url = url
      @api_token = api_token
    end

    def send_event(title)
      uri = URI.parse(url)

      # This is all the post request stuff.
      req = Net::HTTP::Post.new(uri.path)

      # The content type is json
      req.content_type = "application/json"
      req['Accept'] = "application/json"

      # This takes the entered api token and title. This is what is sent. It is a HASH!
      req.body = '{"api_token":"' + api_token + '","incoming_event":{"title":"' + title + '"}}'

      # The request is sent via HTTP to the host and port. You also get a response
      # ex: 201 (it worked)
      Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }
    end
  end
end
