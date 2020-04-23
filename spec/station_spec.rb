require './lib/station.rb'

describe Station do

  it "expects name to be created with new subject" do 
    station1 = Station.new("KX", "Zone1")
    expect(station1.name).to eq("KX")
  end 

  it "expects zone to be created with new subject" do 
    station1 = Station.new("KX", "Zone1")
    expect(station1.zone).to eq("Zone1")
  end 

end 

