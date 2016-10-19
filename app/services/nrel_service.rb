class NrelService
  attr_reader :connection, :zip_code
  
  def initialize(zip_code)
    @zip_code = zip_code
    @connection = Faraday.new("https://developer.nrel.gov")
  end
  
  def find_fuel_stations(zip_code)
    response = connection.get '/api/alt-fuel-stations/v1/nearest.json', 
                    {:api_key => ENV['nrel_token'],
                     :limit => 10,
                     :radius => 6.0,
                     :fuel_type => "ELEC,LPG",
                     :location => "Denver,CO",
                     :zip => zip_code}
    parse(response)
    # @connection.params[:api_key] = ENV['nrel_token']
    # @connection.params[:limit] = 10
    # @connection.params[:radius] = 6.0
    # @connection.params[:fuel_type] = "ELEC,LPG"
    # @connection.params[:location] = "Denver,CO"
    # @connection.params[:zip] = zip_code
  end
  
  private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end