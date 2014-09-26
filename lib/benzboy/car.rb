require'faraday'
require 'json'

API_URL = "http://www.benzboy.com/api/v1/cars/active"
# API_URL = "http://www.bensbenzes.com/api/v1/cars/active"

module Benzboy
  class Car
    attr_reader :id, :make, :model, :year, :color, :vin, :dealer_id

    def initialize(attributes)
      @id        = attributes["id"]
      @make      = attributes["make"]
      @model     = attributes["model"]
      @year      = attributes["year"]
      @color     = attributes["color"]
      @vin       = attributes["vin"]
      @dealer_id = attributes["dealer_id"]
    end

    def self.find(id)
      response   = Faraday.get("#{API_URL}/#{id}")
      response   = "{
                      \"id\": 68,
                      \"make\": \"Honda\",
                      \"model\": \"Civic\",
                      \"year\": \"1996\",
                      \"color\": \"Blue\",
                      \"vin\": \"XXXXXXXXXXXXXX\",
                      \"dealer_id\": 34
                    }"
      attributes = JSON.parse(response)
      new(attributes)
    end
  end
end