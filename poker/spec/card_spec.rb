require 'card'

describe Card do
  subject(:card) { Card.new(:heart, 5) }
  
  describe '#suite' do
    it 'has a suite' do
      expect(card.suite).to eq(:heart)
    end
  end
  
  describe '#rank' do
    it 'has a rank' do
      expect(card.rank).to eq(5)
    end
  end
end
