require "example_api_client"

describe ExampleApiClient do
  describe "employees" do
    let(:employees_response) { ExampleApiClient.employees() }
    it "correctly returns some data" do
      expect(employees_response).to be_kind_of(Hash)
      expect(employees_response).to have_key(:status)
      expect(employees_response).to have_key(:data)
    end
  end
end