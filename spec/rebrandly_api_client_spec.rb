require "rebrandly_api_client"

describe "Rebrandly API" do
  before(:all) do
    @rebrandly_response = create_short_link(
      "https://google.com",
      "11bb3b0f16e7463280ef6946b47182bb",
      "Google",
      "The Googles!!!",
      true
    )
  end

  # Clean up test links
  after(:all) do
    delete_short_link(@rebrandly_response.id)
  end

  it "correctly returns some data" do
    expect(@rebrandly_response.id).to be_a(String)
    expect(@rebrandly_response.title).to eq("Google")
    # expect(@rebrandly_response.slashtag).to eq("https://google.com")
    expect(@rebrandly_response.destination).to eq("https://google.com")
  end
end
