class ParsedInput
  attr_reader :text

  def initialize(text)
    @text = normalize(text)
  end

  def origin
    text.match(/(?<=from\s)(.*?)(?=\sto\s)/).to_s.strip
  end

  def destination
    text.match(/(?<=\sto\s)(.*?)(?=$)/).to_s.strip
  end

  def mode
    if text.match(/walk|on\sfoot/)
      return 'walking'
    elsif text.match(/train|subway|transit/)
      return 'transit'
    elsif text.match(/car|driving|drive/)
      return 'driving'
    elsif text.match(/bicycling|bike/)
      return 'bicycling'
    end
  end

  def valid?
    return !(origin.empty? || destination.empty?)
  end

  private
  def normalize(string)
    string.gsub(/[^a-zA-Z0-9\s]/, '').downcase
  end
end
