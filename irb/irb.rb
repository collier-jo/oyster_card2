require './lib/oystercard'

card = Oystercard.new
card.topup(3)

puts card.balance