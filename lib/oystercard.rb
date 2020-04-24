require 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  def initialize
    @balance = 0 
    @entry_station = nil  
    @exit_station = nil 
    @journeys = []
    @journey = {}
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
    @journey[:entry_station] = @entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    @exit_station = exit_station
    @journey[:exit_station] = @exit_station
    deduct(@journey.fare)
    store_hash_array
    @entry_station = false 
  end

 
  private 
  
  def deduct(fare)
    @balance -= fare 
  end 

  def store_hash_array
    @journeys << @journey
  end 

end
