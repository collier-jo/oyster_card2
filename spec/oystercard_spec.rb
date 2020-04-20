require 'oystercard'

describe Oystercard do

  describe 'balance' do
    it 'responds to balance' do
      expect(subject).to respond_to(:balance)
    end
  
    it 'balance has 0' do
      expect(subject.balance).to eq(0)
    end
  end
end
