require "faraday"
require "json"

class ExampleApiClient
  def self.employees()
    url = "http://dummy.restapiexample.com/api/v1/employees"
    data = Faraday.get(url).body
    p JSON.parse(data, symbolize_names: true)
  end
end
