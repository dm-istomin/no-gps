require_relative 'spec_helper'

describe "ResponseFormatter" do
  before(:each) do
    path = File.dirname(__FILE__) + "/dummy_json/transit_response.json"
    file = File.open(path, "rb")
    contents = file.read
    file.close

    google_api_response = JSON.parse(contents)
    @formatter = ResponseFormatter.new(google_api_response)
  end

  describe "#status_ok?" do
    it "should return true when the Google Maps API returns the correct data" do
      expect(@formatter.status_ok?).to be true
    end
  end
end
