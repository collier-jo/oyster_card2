

class Journey 
    attr_reader :entry_station, :exit_station, :journey, :journeys, :in_journey

    def initialize
      @entry_station = false
      @exit_station = false 
      @journey = {}
      @journeys = []
      @in_journey = false
     
    end
    
    def start(entry_station)
      @entry_station = entry_station
      @journey[:entry_station] = @entry_station
      in_journey?
      @entry_station
    end

    def finish(exit_station)
      @exit_station = exit_station
      @journey[:exit_station] = @exit_station
      @journeys << @journey 
    end 

    def complete?
      if @entry_station && @exit_station
        reset
        return true
      end
    end 

    def fare
      complete? ? 1 : 6
    end

    def in_journey?
      @in_journey = true if @entry_station && (@exit_station == false)
    end 

    private 
    def reset
      @entry_station = false
      @exit_station = false
    end



end

