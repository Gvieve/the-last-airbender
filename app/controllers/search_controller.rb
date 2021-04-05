class SearchController < ApplicationController
  def index
    nation = params[:nation].gsub('_', '+')
    conn = Faraday.new("https://last-airbender-api.herokuapp.com/api/v1/characters")
    response = conn.get("?perPage=100&page=1&affiliation=#{nation}")
    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    @total = json.count
    @characters = json[0..24].map do |data|
      # require "pry"; binding.pry
    end
  end
end
