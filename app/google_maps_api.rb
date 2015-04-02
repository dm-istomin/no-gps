module GoogleMapsAPI
  def self.get_directions(from:, to:, mode: "transit")
    request = RestClient.get "https://maps.googleapis.com/maps/api/directions/json",
              params: {mode: mode,
                       origin: from,
                       destination: to,
                       key: ENV['GOOGLE_API']}
    JSON.parse(request)
  end
end
