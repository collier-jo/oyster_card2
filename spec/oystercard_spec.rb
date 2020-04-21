require 'oystercard'

describe Oystercard do

  describe 'balance' do
  
    it 'balance has 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe 'topup' do

    it 'adds topup amount to balance' do
      expect { subject.topup(3) }.to change(subject, :balance).to eq(3)
    end
  end
end
