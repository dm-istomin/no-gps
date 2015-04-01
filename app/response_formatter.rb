class ResponseFormatter
  attr_reader :google_api_data

  def initialize(google_api_data)
    @google_api_data = google_api_data
  end

  def status_ok?
    google_api_data["status"] == "OK" || false
  end

end
