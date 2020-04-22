require './lib/oystercard'

card = Oystercard.new
card.top_up(6)
card.touch_in
card.entry_station