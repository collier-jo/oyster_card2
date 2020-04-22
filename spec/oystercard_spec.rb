require 'oystercard'

describe Oystercard do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  describe 'balance' do
  
    it 'balance has 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe 'top_up' do

    it 'adds topup amount to balance' do
      expect { subject.top_up(3) }.to change(subject, :balance).to eq(3)
    end

    it 'raises error when top_up goes over £90' do
      expect { subject.top_up(91) }.to raise_error("Exceeds max balance of £#{Oystercard::BALANCE_LIMIT}")
    end
  end

  describe "deduct" do 
    it "deducts given fare from balance" do
      expect { subject.send(:deduct, 3) }.to change(subject, :balance).to eq(-3)
    end 
  end

  describe "in_journey?" do
    it "returns false when instance is created" do
      expect(subject.in_journey?).to eq(nil)
    end 
  end

  describe "touch_in" do 
    it "Updates in_jounrey to true when touch_in called" do
      subject.top_up(2)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end 

    it "raises error when card balance is below min limit" do
      expect { subject.touch_in(entry_station) }.to raise_error("Below minimum limit of £#{Oystercard::MIN_FARE}")
    end 

    it "Updates entry_station to station argument" do 
      subject.top_up(3)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end 

    it "Pushes entry_station into Journeys instanse array" do 
      subject.top_up(3)
      subject.touch_in(entry_station)
      expect(subject.journeys).to include(entry_station)
    end 
  end 

  describe "touch_out" do 

    it {is_expected.to respond_to(:touch_out).with(1).argument}

    it "Updates in_jounrey to false when touch_out called" do
      subject.top_up(2)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end 

    it "Deducts min fare when touch_out called" do
      subject.top_up(2)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change{subject.balance}.by(-Oystercard::MIN_FARE)
    end 

    it "return entry_station instance to nil" do 
      subject.top_up(2)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq(false)
    end 

    it "Pushes exit_station into Journeys instanse array" do 
      subject.top_up(3)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include(entry_station, exit_station)
    end 
  end 

  describe "#entry_station" do 
    it "is nil when card created" do 
      expect(subject.entry_station).to eq(nil)
    end 
  end 

  describe "#journeys" do
    it "starts off with no journeys" do 
     expect(subject.journeys).to be_empty
    end 
  end 
end 