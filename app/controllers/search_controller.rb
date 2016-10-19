class SearchController < ApplicationController
  def index
    @connection = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json")
    @connection.params[:api_key] = ENV['nrel_token']
    @connection.params[:limit] = 10
    @connection.params[:radius] = 6.0
    @connection.params[:fuel_type] = "ELEC,LPG"
    @connection.params[:location] = "Denver,CO"
    @connection.params[:zip] = params[:q]
  end
end