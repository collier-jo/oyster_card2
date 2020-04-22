require './lib/oystercard'

card = Oystercard.new
card.top_up(6)
card.touch_in("station")
card.touch_out
puts card.entry_station