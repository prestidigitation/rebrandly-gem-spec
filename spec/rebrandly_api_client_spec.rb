require "rebrandly_api_client"

describe "Rebrandly API" do
  test_destination_url = "https://hamster.dance/hamsterdance/"
  v4v_domain_id = "11bb3b0f16e7463280ef6946b47182bb"
  v4v_domain_name = "v4v.info"
  test_title = "Hamster Dance"
  test_description = "This page is full of hamsters!!!"

  # # Create test link on Rebrandly live API
  # before(:all) do
  #   domain_info = get_domain_info(v4v_domain_id)

  #   @rebrandly_response = create_short_link(
  #     test_destination_url,
  #     domain_info,
  #     test_title,
  #     test_description,
  #   )
  # end

  # # Clean up test link from Rebrandly live API
  # after(:all) do
  #   delete_short_link(@rebrandly_response.id)
  # end

  # it "returns info about a domain" do
  #   reponse = get_domain_info(v4v_domain_id)
  #   expect(response.id).to be_a(String)
  # end

  it "fetches domain info object from Rebrandly live API" do
    domain_info = get_domain_info(v4v_domain_id)
    expect(domain_info.id).to eq(v4v_domain_id)
    expect(domain_info.full_name).to eq(v4v_domain_name)
  end


  # it "correctly returns some data" do
  #   expect(@rebrandly_response.id).to be_a(String)
  #   expect(@rebrandly_response.title).to eq(test_title)
  #   # expect(@rebrandly_response.slashtag).to eq("something")
  #   expect(@rebrandly_response.destination).to eq(test_destination_url)
  #   expect(@rebrandly_response.short_url).to match("v4v.info")
  # end
end
