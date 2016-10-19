class NrelService
  def self.find_fuel_stations(zip_code)
    @connection = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json")
    @connection.params[:api_key] = ENV['nrel_token']
    @connection.params[:limit] = 10
    @connection.params[:radius] = 6.0
    @connection.params[:fuel_type] = "ELEC,LPG"
    @connection.params[:location] = "Denver,CO"
    @connection.params[:zip] = zip_code
    @connection.get
  end
end