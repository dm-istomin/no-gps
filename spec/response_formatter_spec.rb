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
      .to eq "[21 mins, 4.2 mi]: Head southeast on Wall St toward William St. Turn left onto William St. At 6:51pm, take 2 from Wall St Subway towards Wakefield - 241 St; exit at Times Sq - 42 St. Head northeast on 7th Ave toward W 42nd St. Turn right onto W 47th St. Walk until you reach Theater District, New York, NY, USA"
    end
  end
end
