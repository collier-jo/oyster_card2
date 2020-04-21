require './lib/oystercard'

card = Oystercard.new
card.top_up(2)
card.deduct(1)

puts card.in_journey? 

card.touch_in
card.touch_out

puts card.balance