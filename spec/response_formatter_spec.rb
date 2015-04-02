require_relative 'spec_helper'

describe "ResponseFormatter" do
  before(:all) do
    @google_api_response = {}
    file_location = File.dirname(__FILE__) + "/dummy_json"

    Dir.foreach(file_location) do |item|
      next if item == "." || item == ".."
      file = File.open("#{file_location}/#{item}", "rb")
      contents = file.read
      @google_api_response[item.match(/\w+/).to_s.to_sym] = JSON.parse(contents)
      file.close
    end
  end

  describe "#status_ok?" do
    it "should return true when the Google Maps API returns the correct data" do
      formatter = ResponseFormatter.new(@google_api_response[:transit])
      expect(formatter.status_ok?).to be true
    end
  end

  describe "#directions" do
    it "should return transit directions in a simple, readable format" do
      formatter = ResponseFormatter.new(@google_api_response[:transit])
      expect(formatter.directions)
      .to eq "[21 mins, 4.2 mi]: Head southeast on Wall St toward William St. Turn left onto William St. At 6:51pm, take 2 from Wall St Subway towards Wakefield - 241 St; exit at Times Sq - 42 St. Head northeast on 7th Ave toward W 42nd St. Turn right onto W 47th St. Walk until you reach Theater District, New York, NY, USA."
    end

    it "should return walking directions in a simple, readable format" do
      formatter = ResponseFormatter.new(@google_api_response[:walking])
      expect(formatter.directions)
      .to eq "[43 mins, 3.4 km]: Head southwest toward Place du Carrousel. Exit the roundabout onto Place du Carrousel. Turn right onto Quai François Mitterrand. Slight left onto Pont Royal. Turn right onto Quai Anatole France. Slight right. Slight right. Slight right onto Voie Expresse Rive Gauche. Slight left to stay on Voie Expresse Rive Gauche. Continue onto Quai Branly. Take the crosswalk. Walk until you reach Champ de Mars, Eiffel Tower, 5 Avenue Anatole France, 75007 Paris, France."
    end
  end
end
