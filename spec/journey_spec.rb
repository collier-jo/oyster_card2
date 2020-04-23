require "journey"

describe Journey do

    let(:entry_station) { double :journey }
    
  describe "#initialize" do
      
    it "starts with not entry station" do
      expect(subject.entry_station).to be(false)
    end
    
    it "starts with empty journey hash" do
      expect(subject.journey).to be_empty
    end
    
    it "starts a new journey" do
      expect(subject.in_journey).to eq(true)
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
  end
  