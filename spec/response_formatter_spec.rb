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

  describe "#directions" do
    it "should return directions in an easy-to-understand format" do
      expect(@formatter.directions)
      .to eq "[21 minutes, 4.8 miles]: Head northeast on Wall Street towards William St. Turn left onto William St. At 6:43, take the 2 from Wall Street towards Wakefield - 214 St; get off at 34 St - Penn Station. Head northeast on 7th Ave toward W 42nd St. Slight left onto Broadway. Turn left on W 46th St.Destination will be on the right - Times Square, Manhattan, NY."
    end
  end
end
