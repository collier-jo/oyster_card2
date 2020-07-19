# Oystercard Challenge

## Motivation

## Code style
Ruby-standard-style RSPEC testing

## Tech Stack
- Ruby 
- RSpec 

## User Story

```
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

```

## Domain Model::

|Object|Message|
|---|---|
|Oystercard||
||initalise|
||-balance |
||.topup|
||.deduct(private)|
||.touch_in|
||- min amount|
||.touch_out|
||- deduct |
||min_amount? <constant £1>|
|Station|| 
||name |
||zone |
|Journey||
||in_journey|
||journey = []
||entry station|
||- new station instance |
||-in_journey = true |
||exit_station |
||- new station instance |
||-in_journey = false |




                    
## Tests 

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

