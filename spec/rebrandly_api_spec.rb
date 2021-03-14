require "rebrandly"

Rebrandly.configure do |config|
  config.api_key = ENV["REBRANDLY_KEY"]
end

describe "Rebrandly service" do
  v4v_domain_id = "11bb3b0f16e7463280ef6946b47182bb"
  v4v_domain_name = "v4v.info"
  destination_url = "https://hamster.dance/hamsterdance/"
  title = "Hamster Dance"

  before(:all) do
    @api = Rebrandly::Api.new
  end

  it "fetches domain info object from Rebrandly live API" do
    domain_info = @api.domain(v4v_domain_id)
    expect(domain_info.id).to eq(v4v_domain_id)
    expect(domain_info.full_name).to eq(v4v_domain_name)
  end

  it "creates a shortUrl on Rebrandly live API" do
    domain_info = @api.domain(v4v_domain_id)
    response = @api.shorten(
      destination_url,
      domain: domain_info.to_h,
      title: title
    )

    expect(response.id).to be_a(String)
    expect(response.destination).to eq(destination_url)
    expect(response.title).to eq(title)
    expect(response.short_url).to match("v4v.info")

    # Clean up test link from Rebrandly live API
    @api.delete(response.id)
    # Double check that the test link was deleted from Rebrandly live API
    expect { @api.link(response.id) }.to raise_error(Rebrandly::RebrandlyError, "Not found")
  end
end
