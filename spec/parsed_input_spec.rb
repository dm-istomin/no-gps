require_relative 'spec_helper'

describe "ParsedInput" do
  before(:each) do
    @well_formatted_input = ParsedInput.new("from penn station, new york to grand central, new york")
    @well_formatted_shorthand_input = ParsedInput.new("penn station, new york to grand central, new york")
  end
  describe "#origin" do
    it "should get the correct input from a text" do
      expect(@well_formatted_input.origin).to eq "penn station, new york"
    end

    it "should get the correct input from a text that omits the 'from' keyword" do
      expect(@well_formatted_shorthand_input.origin).to eq "penn station, new york"
    end
  end

  describe "#destination" do
    it "should get the correct input from a text" do
      expect(@well_formatted_input.destination).to eq "grand central, new york"
    end

    it "should get the correct input from a text that omits the 'from' keyword" do
      expect(@well_formatted_shorthand_input.destination).to eq "grand central, new york"
    end
  end
  
  describe "#mode"
end
