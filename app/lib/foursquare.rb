module Foursquare
  def api_call(search, location)
    url_root = "https://api.foursquare.com/v2/venues/"
    url_root_search = "#{url_root}search?"
    credentials = "&client_id=#{ENV["FOURSQUARE_CLIENT_ID"]}&client_secret=#{ENV["FOURSQUARE_CLIENT_SECRET"]}"
    versionDate = "&v=20190703"
    limit = "&limit=10"
    food_category_id = "4d4b7105d754a06374d81259"
    bar_category_id = "4bf58dd8d48988d116941735"
    hotel_category_id = "4bf58dd8d48988d1fa931735"
    corporate_venue_id = "5665c7b9498e7d8a4f2c0f06"
    coworking_space_id = "4bf58dd8d48988d174941735"
    category_ids = "#{food_category_id},#{bar_category_id},#{hotel_category_id},#{corporate_venue_id},#{coworking_space_id}"
    full_search = "#{url_root_search}near=#{location}&query=#{search}&categoryId=#{category_ids}#{limit}#{credentials}#{versionDate}"
    return full_search
  end
end