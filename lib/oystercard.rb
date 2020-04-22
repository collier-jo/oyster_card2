class Oystercard
  attr_reader :balance, :entry_station

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0 
    @entry_station = nil  
  end

  def top_up(amount)
    raise "Exceeds max balance of £#{BALANCE_LIMIT}" if (balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def in_journey?
    @entry_station
  end 

  def touch_in(station)
    raise "Below minimum limit of £#{Oystercard::MIN_FARE}" if @balance < MIN_FARE 
    @entry_station = station 
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = false 
  end

  private 
  
  def deduct(fare)
    @balance -= fare 
  end 

end
