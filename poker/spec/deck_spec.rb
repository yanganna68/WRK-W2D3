require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#make_deck' do
    it 'makes a deck of 54 cards' do
      deck.make_deck
      expect(deck.cards.size).to eq(54)
    end
  end
  
  describe '#cards' do
    it 'has 13 of each suite' do
      deck.make_deck
      hearts = deck.cards.select { |card| card.suite == :heart }
      spades = deck.cards.select { |card| card.suite == :spade }
      diamonds = deck.cards.select { |card| card.suite == :diamond }
      clubs = deck.cards.select { |card| card.suite == :club }
      
      expect(hearts.size).to eq(13)
      expect(spades.size).to eq(13)
      expect(diamonds.size).to eq(13)
      expect(clubs.size).to eq(13)
    end
    
    it 'has 2 jokers' do
      deck.make_deck
      jokers = deck.cards.select { |card| card.rank == 1 }
      expect(jokers.size).to eq(2)
    end
  end
  
  describe '#shuffle_cards' do
    it "shuffles the cards" do
      unshuffled = deck.make_deck
      shuffled = deck.shuffle_cards
      expect(shuffled).not_to eq(unshuffled)
    end
  end
  
  
end