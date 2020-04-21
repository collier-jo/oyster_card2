class Oystercard
  attr_reader :balance, :in_journey

  BALANCE_LIMIT = 90

  def initialize
    @balance = 0 
    @in_journey = false
  end

  def top_up(amount)
    raise "Exceeds max balance of £#{BALANCE_LIMIT}" if (balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end 

  def in_journey?
    @in_journey 
  end 

  def touch_in
    @in_journey = true 
  end

  def touch_out
    @in_journey = false 
  end


end
