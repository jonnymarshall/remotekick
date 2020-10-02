class AlgoliaPlaces
  include HTTParty
  # debug_output $stderr
  base_uri 'https://places-dsn.algolia.net'

  def initialize(query)
    @options = {
      headers: {
        "X-Algolia-Application-Id" => ENV["PLACES_APP_ID"],
        "X-Algolia-API-Key" => ENV["PLACES_API_KEY"]
      },
      body: {
        'query' => query,
        'type' => 'city',
        'hitsPerPage' => 5,
        'language' => 'en',
        'getRankingInfo' => 'true'
      }.to_json
    }
  end

  def run_query
    self.class.post("/1/places/query", @options)
  end

  def log_result
    self.run_query.request.last_uri.to_s
  end
end