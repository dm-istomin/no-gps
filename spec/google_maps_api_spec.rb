describe "GoogleMapsAPI" do
  describe "#get_directions" do
    pending "makes requests to the Google API, only set to non-pending if API handling needs to be tested"

    before(:all) do
      @response = GoogleMapsAPI.get_directions(
                    from: "smithsonian air and space museum, washington d.c",
                    to: "white house rose garden, washington d.c",
                    mode: "transit"
                  )
    end

    it "should return a Hash" do
      expect(@response.class).to eq Hash
    end

    it "should return with a status of 'OK' for valid requests" do
      expect(@response["status"]).to eq "OK"
    end

    it "should evaluate the input to point to the correct end address" do
      expect(@response['routes'][0]['legs'][0]['end_address']).to eq "White House Rose Garden, 1600 Pennsylvania Avenue Northwest, Washington, DC 20500, USA"
    end

    it "should evaluate the input to point to the correct start address" do
      expect(@response['routes'][0]['legs'][0]['start_address']).to eq "Smithsonian National Air and Space Museum, National Mall, 600 Independence Avenue Southwest, Washington, DC 20560, USA"
    end
  end
end
