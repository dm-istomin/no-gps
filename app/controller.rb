get "/" do
  "Hello world! The server is live!"
end

get "/sms-directions" do
  request = params[:Body]
  redirect_to "/directions?query=#{request}"
end

get "/directions" do
  error_msg = "Cannot give directions until two addresses are provided in the format 'from [address] to [address]'!"
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
