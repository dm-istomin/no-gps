class ResponseFormatter
  attr_reader :google_api_data

  def initialize(google_api_data)
    @google_api_data = google_api_data
  end

  def status_ok?
    google_api_data["status"] == "OK" || false
  end

  def directions
    "[#{trip_time}, #{trip_distance}]: #{trip_steps}"
  end

  def trip_time
    google_api_data["routes"][0]["legs"][0]["duration"]["text"]
  end

  def trip_distance
    google_api_data["routes"][0]["legs"][0]["distance"]["text"]
  end

  def trip_steps
    format_trip_steps(google_api_data["routes"][0]["legs"][0]["steps"])
  end

  private

  def clean_html(html_string)
    html_string.gsub(/<[^>]*>/, "")
  end

  def format_trip_steps(steps, directions = [])
    steps.each do |current_step|
      directions << current_step["html_instructions"]
      format_trip_steps(current_step["steps"], directions) if current_step["steps"]
    end
    clean_html(directions.join(". "))
  end
end
