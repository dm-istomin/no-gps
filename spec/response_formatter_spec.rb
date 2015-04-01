require_relative 'spec_helper'

describe "Parser" do
  before(:each) do
    path = File.dirname(__FILE__) + "/dummy_json/transit_response.json"
    file = File.open(path, "rb")
    contents = file.read
    file.close
    
    @google_api_response = JSON.parse(contents)
  end
end
