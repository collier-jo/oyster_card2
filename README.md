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
             | deduct(JOUNREY NEW INSTANCE??? ) -= balance 
                @jounrey = Journey.new
             | * in_jouney? = false 
                        - 
             | touch_in - (entrystation)
                                                                     *- updates @in_jounrey? true
                        - throws error when below min balance
                       
                          
                                                                    /*- updates the entry to station name  
                                                                     *- shove entry to journey 
                        
                        * - INTERACT
                                - @jounrey.start(KX = Station.new("KX", 1))
                                - calls start method in journey(entry_station)
                                
             | touch_out - updates to false
                        - changes balance by min fare 
                                                      /*- returns entry to nil 
                                                        * - shove exit into journey{}
                                                        * - shove the has into array 
                        * - INTERACT 

             | constant = min balance 
             |                          *instance/ attr - entry_station starts as nil 
             |                          *store_hash_array
             | *in_journey? 


|Station     | Initialize = (name, zone)
                        - @name = name 
                        - @zone = zone 

 @entry_station && (@exit_station == false) ? @in_journey = true : @in_journey = false
    end


|Jounrey     | @entry_Station
               @journey = {}
               @in_journey = true
               @exit_station = false  
               @journeys = []


                starting (entry_stations )
                        - @entrysStation = entry station 
                        - @journey[entry] = @entry       
             | finishing
                                        - changes @ exit to = exit /
                                        - change @ entry = false /
                                        - shove exit into hash / 
                                        - shove hash into array /
             | Fare 
                  - Calculate the fare 
                  - Min fare = 1 (every touchin and out = 1)
                  - Penalty = 6   
             |                              returning if jounrey is complete? (Boolean of true of false)


              The #fare method should return the minimum fare (for the moment), or the penalty fare of 6 if there was either no entry station or no exit station.



                    
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

