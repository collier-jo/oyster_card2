require './lib/oystercard'

card = Oystercard.new
card.top_up(89)
card.top_up(2)

puts card.balance