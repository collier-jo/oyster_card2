
require './lib/oystercard'


card = Oystercard.new
card.top_up(6)
card.touch_in("station")
card.touch_out("station")
card.journeys 






=begin
current_journey = {}
journey = []

current_journey[:entry] = "jo" 
current_journey[:exit] = "ellis"

journey << current_journey 

current_journey[:entry] = "hello" 
current_journey[:exit] = "goodbye"

journey << current_journey 

puts journey
=end 