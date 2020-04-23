class Journey 
    attr_reader :entry_station, :journey, :in_journey

    def initialize
      @entry_station = false
      @journey = {}
      @in_journey = true
     
    end
    
    def start(entry_station)
      @entry_station = entry_station
      @journey[:entry_station] = @entry_station
    end
end