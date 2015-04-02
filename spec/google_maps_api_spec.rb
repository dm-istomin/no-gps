describe "GoogleMapsAPI" do
  describe "#get_directions" do
    before(:all) do
      GoogleMapsAPI.get_directions(
      from: "smithsonian air and space museum, washington d.c",
      to: "white house rose garden, washington d.c",
      mode: "transit"
      )
    end

    it "should return a Hash"
    it "should return with a status of 'OK'"
  end
end
