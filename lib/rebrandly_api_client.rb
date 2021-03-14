require "rebrandly"

Rebrandly.configure do |config|
  config.api_key = ENV["REBRANDLY_KEY"]
end

def get_domain_info(id)
  api = Rebrandly::Api.new
  api.domain(id)
end

def create_short_link(destination_url, domain_info, title, description)
  api = Rebrandly::Api.new
  link = api.shorten(
    destination_url,
    domain_info: domain_info.to_h,
    title: title,
    description: description,
  )
end

def delete_short_link(id)
  api = Rebrandly::Api.new
  api.delete(id)
end
