# require "event_girl_client/version"

# TODO I commented out this require because it doesn't work with it.
# Why is this, why do we need it?

require 'net/http'
require "uri"

require 'rubygems'
require 'json'

# module EventGirlClient

# TODO I commented out the module because for some reason it doesn't
# work with it in. Why is this? Is a module necessary?

  def send_event(url, api_token, title)

  	# The uri takes a url and splits it up into a path (/incoming_events),
  	# a host (localhost) and a port (3000) which are used in the req and the response
  	# This is necessary so that a user only has to enter the 3 parameters with
  	# the sent_event call.
  	uri = URI(url)

  	# This takes the entered api token and title. This is what is sent. It is a HASH!
		payload = {
			"api_token" => api_token,
			"title" => title
		}

		# This is all the post request stuff.
		req = Net::HTTP::Post.new(uri.path)
		# The payload is converted to json
		req.body = payload.to_json
		# The content type is json
		req.content_type = "application/json"

		# The request is sent via HTTP to the host and port. You also get a response
		# ex: 201 (it worked)
		response = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

	end

# end
