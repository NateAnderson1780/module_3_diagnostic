require 'rails_helper'

describe "User can find alternative fuel stations" do
  it "can find fuel stations by zip code" do
    visit '/'
    
    fill_in "q", with: "80203"
    click_on "Locate"
    
    expect(current_path).to eq('/search')
    
    within(".closest_stations") do
      expect(stations.count).to eq(10)
      expect(station.first.type).to eq(10)
    end
  end
end