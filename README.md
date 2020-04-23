# oystercard
Makers Week 2 challenge

In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers.
As a customer
I need to touch in and out.

In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.

In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card

In order to pay for my journey
As a customer
I need to know where I've travelled from


In order to know where I have been
As a customer
I want to see all my previous trips



In order to know how far I have travelled
As a customer
I want to know what zone a station is in




Domain Model::

| Object     | Message |
| ---        | ---   |
| Oystercard | balance |
|            | top_up(amount) += balance
             | deduct(fare) -= balance 
             | in_jouney? = false 
                        - 
             | touch_in - updates @in_jounrey? true
                        - throws error when below min balance
                        - updates the entry tostation name  
                        - shove entry to journey            
             | touch_out - updates to false
                        - changes balance by min fare 
                        - returns entry to nil 
                        - shove exit into journey 
             | constant = min balance 
             | instance/ attr - entry_station starts as nil 
             | journey method:
                        - @journey << @entry
                        - @jounrey << @exit
                        - @journey.each { |record| journey << {'entry' => @entry_station, "exit" => @exit} }

|Station     | Initialize = (name, zone)
                        - @name = name 
                        - @zone = zone 

                    
#test

- `top_up` should raise an error when the balance goes over 90

- in_journey?
  - when created its false

- touch_in
  - changes in_journey to true
  - raises an error if already on a journey
  - changes entry_station  to true 

- touch_out
  - changes in_journey to be false
  - raises an error if not on a journey
  - changes to nil 

- entry_station = nil 

- When a new station is being created 

