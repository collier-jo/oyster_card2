require './lib/oystercard'

card = Oystercard.new
card.top_up(2)
card.deduct(1)

card.in_journey? 

puts card.balance