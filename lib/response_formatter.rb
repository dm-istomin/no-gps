class ResponseFormatter
  attr_reader :google_api_data

  def initialize(google_api_data)
    @google_api_data = google_api_data
  end

  def status_ok?
    google_api_data["status"] == "OK" || false
  end

  def directions
    if status_ok?
      "[#{trip_time}, #{trip_distance}]: #{trip_steps}"
    else
      "Something appears to have gone wrong: error #{google_api_data["status"]}. Try re-phrasing your query, and if that doesn't work it's probably something on our end. Sorry!"
    end
  end

  def trip_time
    google_api_data["routes"][0]["legs"][0]["duration"]["text"]
  end

  def trip_distance
    google_api_data["routes"][0]["legs"][0]["distance"]["text"]
  end

  def trip_steps
    format_trip_steps(google_api_data["routes"][0]["legs"][0]["steps"]) + ". Walk until you reach #{google_api_data['routes'][0]['legs'][0]['end_address']}."
  end

  private

  def clean_html(html_string)
    html_string.gsub(/<[^>]*>/, "").gsub(/Destination will be on the (right|left)/, "")
  end

  def format_trip_steps(steps, directions = [])
    steps.each do |current_step|
      if current_step["travel_mode"] == "WALKING"
        if current_step["steps"]
          format_trip_steps(current_step["steps"], directions)
        else
          directions << current_step["html_instructions"]
        end
      elsif current_step["travel_mode"] == "TRANSIT"
        directions << format_transit_steps(current_step)
      end
    end
    clean_html(directions.join(". "))
  end

  def format_transit_steps(steps)
    transit = steps["transit_details"]["line"]["short_name"]
    departure_time = steps["transit_details"]["departure_time"]["text"]
    departure_stop = steps["transit_details"]["departure_stop"]["name"]
    arrival_stop = steps["transit_details"]["arrival_stop"]["name"]
    "At #{departure_time}, take the #{transit} (#{steps['html_instructions']}) from #{departure_stop}; exit at #{arrival_stop}"
  end
end
