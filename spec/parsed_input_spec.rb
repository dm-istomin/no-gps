require_relative 'spec_helper'

describe "ParsedInput" do
  before(:each) do
    @input = ParsedInput.new("bike from penn station, new york to grand central, new york")
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
    it "should return the correct transportation type" do
      expect(@input.mode).to eq "bicycling"
    end
  end
end
