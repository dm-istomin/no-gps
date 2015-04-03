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

  describe "#valid?" do
    before(:all) do
      @random_characters = ParsedInput.new("sdfadsfhw jfge")
      @missing_addresses = ParsedInput.new("bike")
      @missing_origin = ParsedInput.new("walk from to Leaning Tower of Pisa, Pisa, Italy")
      @missing_destination = ParsedInput.new("walk from Reichstag Building, Germany to")
      @valid_input = ParsedInput.new("walk from Capri Town, Italy to Belvedere Tragara, Italy")
    end

    it "should return false for an input of empty characters" do
      expect(@random_characters.valid?).to eq false
    end

    it "should return false for an input that is missing addresses" do
      expect(@missing_addresses.valid?).to eq false
    end

    it "should return false for an input that does not have an origin address" do
      expect(@missing_origin.valid?).to eq false
    end

    it "should return false for an input that does not have a destination address" do
      expect(@missing_destination.valid?).to eq false
    end

    it "should return true for an input that has both origin and destination" do
      expect(@valid_input.valid?).to eq true
    end
  end
end
