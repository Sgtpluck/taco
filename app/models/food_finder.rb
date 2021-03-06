class FoodFinder
  attr_accessor :longitude, :latitude, :term

  def initialize(location_and_type_hash)
    @longitude = location_and_type_hash[:longitude]
    @latitude = location_and_type_hash[:latitude]
    @term = location_and_type_hash[:path]
  end

  def sorted_google_response
    HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@latitude},#{@longitude}&rankby=distance&types=food&keyword=#{@term}&sensor=true&opennow&key=#{Figaro.env.google_places}")['results']
  end

  def closest_google
    if curse_words?
      return "curses".to_json
    else
      sorted_google_response.first
    end
  end

  def curse_words?
    curses = CSV.read("./lib/cursewords.csv").first.each { |curse| curse.strip! }
    curses.include? @term
  end

end
