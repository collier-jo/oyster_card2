require "journey"

describe Journey do

    let(:entry_station) { double :journey }
    let(:exit_station) { double :journey }
    
  describe "#initialize" do
      
    it "starts with not entry station" do
      expect(subject.entry_station).to be(false)
    end

    it "starts with exit station as false" do 
      expect(subject.exit_station).to be(false)
    end
    
    it "starts with empty journey hash" do
      expect(subject.journey).to be_empty
    end

    it "starts with empty journey array" do
      expect(subject.journeys).to be_empty
    end
    
    it "starts a new journey" do
      expect(subject.in_journey).to eq(false)
    end
    
  end
    
  describe "#start" do
    
    it { is_expected.to respond_to(:start).with(1).argument }
    
    it "will save the entry station" do
      expect(subject.start(entry_station)).to eq(subject.entry_station)
    end
    
    it "will save entry station into hash" do
        subject.start(entry_station)
        expect(subject.journey).to eq(:entry_station => entry_station)
    end
  end

  describe '#finish' do 

    it { is_expected.to respond_to(:finish).with(1).argument }

    it "Returns exit_station to journey hash" do 
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journey).to eq(:entry_station => entry_station, :exit_station => exit_station)
    end 

    it "Checks if journeys contains a hash" do
      subject.start(entry_station)
      subject.finish(exit_station)
      completed_journey = subject.journey
      expect(subject.journeys).to include(completed_journey)
    end
  end

  describe "#in_journey" do 
    it "change to true when start method called" do 
      subject.start(entry_station)
      expect(subject.in_journey).to eq(true)
    end 

    it "change to false when finish method called" do 
      subject.finish(exit_station)
      expect(subject.in_journey).to eq(false)
    end 
  end 

  describe "complete?" do
    it "Returns true if entry and exit stations are true" do
      subject.start(entry_station)
      expect(subject.finish(exit_station)).to eq(true)
    end

    it "Changes entry_station instance to false" do 
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.complete?).to eq(false)
    end 

    it "Changes exit station instance to false" do 
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.exit_station).to eq(false)
    end 
  end

  describe "#fare" do
    it "To return 1 if user has started and finished journey" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.fare).to eq (1)
    end 

    it "To return 1 if user has started and finished journey" do
      subject.start(entry_station)
      expect(subject.fare).to eq (6)
    end 
  end 



end 

=begin
describe "#fare" do
    it "charges £1 for a complete journey" do 
      card = Oystercard.new
      card.top_up(6)
      subject.start(entry_station)
      expect { subject.finish(exit_station) }.to change(card, :balance).by (-1)
    end 
  end 
=end 