class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0 
    @entry_station = nil  
    @exit_station = nil 
    @journeys = []
  end

  def top_up(amount)
    raise "Exceeds max balance of £#{BALANCE_LIMIT}" if (balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def in_journey?
    @entry_station
  end 

  def touch_in(entry_station)
    raise "Below minimum limit of £#{Oystercard::MIN_FARE}" if @balance < MIN_FARE 
    @entry_station = entry_station  
    @journeys << @entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    @exit_station = exit_station
    @entry_station = false 
    @journeys << @exit_station
  end

  private 
  
  def deduct(fare)
    @balance -= fare 
  end 

end
