require "rebrandly"

Rebrandly.configure do |config|
  config.api_key = ENV["REBRANDLY_KEY"]
end

def create_short_link(url, domain, title, description, favourite)
  api = Rebrandly::Api.new
  link = api.shorten(
    url,
    domain: domain,
    title: title,
    description: description,
    favourite: favourite
  )
end

def delete_short_link(id)
  api = Rebrandly::Api.new
  api.delete(id)
end
