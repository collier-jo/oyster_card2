require 'oystercard'

describe Oystercard do

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
end
