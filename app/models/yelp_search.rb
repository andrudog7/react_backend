class YelpSearch

    attr_reader :results 

    def initialize(location, offset)
        url="https://api.yelp.com/v3/businesses/search"
        params = {
            location: location,
            categories: "brunch",
            limit: 50,
            offset: offset
        }

        response = HTTP.auth("Bearer #{ENV['YELP_KEY']}").get(url, params: params)
        @results = response.parse
    end
    
end