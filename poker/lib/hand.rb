class Hand
  attr_reader :deck
  
  def initialize(deck)
    @deck = deck
  end
  
  def make_hand
    deck.pop(5)
  end
  
  def discard_from_hand(card)
    
  end
  
  def add_to_hand(card)
  end
end