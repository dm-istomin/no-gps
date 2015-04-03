require_relative 'spec_helper'

describe "ParsedInput" do
  before(:each) do
    @input = ParsedInput.new("from penn station, new york to grand central, new york")
  end

  describe "#origin" do
    it "should get the correct input from a text" do
      expect(@input.origin).to eq "penn station new york"
    end
  end

  describe "#destination" do
    it "should get the correct input from a text" do
      expect(@input.destination).to eq "grand central new york"
    end
  end

  describe "#mode" do
    before(:all) do
      @train_input = ParsedInput.new("train from penn station, new york to grand central, new york")
      @subway_input = ParsedInput.new("subway from penn station, new york to grand central, new york")
      @transit_input = ParsedInput.new("from penn station, new york to grand central, new york by transit")
      @car_input = ParsedInput.new("from penn station, new york to grand central, new york by car")
      @driving_input = ParsedInput.new("drive from penn station, new york to grand central, new york by car")
      @walk_input = ParsedInput.new("walk from penn station, new york to grand central, new york")
      @bike_input = ParsedInput.new("from penn station, new york to grand central, new york by bike")
    end

    it "should return the correct transportation type for various 'transit' synonyms" do
      expect(@train_input.mode).to eq "transit"
      expect(@subway_input.mode).to eq "transit"
      expect(@transit_input.mode).to eq "transit"
    end

    it "should return the correct transportation type for various 'car' synonyms" do
      expect(@car_input.mode).to eq "driving"
      expect(@driving_input.mode).to eq "driving"
    end

    it "should return the correct transportation type for various 'bicycling' synonyms" do
      expect(@bike_input.mode).to eq "bicycling"
    end

    it "should return the correct transportation type for various 'walk' synonyms" do
      expect(@walk_input.mode).to eq "walking"
    end
  end
end
