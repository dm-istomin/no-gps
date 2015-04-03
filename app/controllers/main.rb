get "/" do
  erb :test
end

get "/directions" do
  error_msg = "Not enough addresses; cannot give directions until two are provided!"
  begin
    query = ParsedInput.new(params[:query])
  rescue ArgumentError
    return error_msg
  end

  if query.valid?
    directions = GoogleMapsAPI.get_directions(from: query.origin,
                                              to: query.destination,
                                              mode: query.mode)
    result = ResponseFormatter.new(directions)
    return result.directions
  else
    return error_msg
  end
end
