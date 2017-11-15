class Deck
  SUITES = [:heart, :spade, :club, :diamond]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
  WILD_CARDS = [:black_joker_big, :red_joker_small]

  attr_reader :cards

  def initialize
    @cards = []
  end
  
  def make_deck
    SUITES.each do |suite|
      RANKS.each do |rank|
        cards << Card.new(suite, rank)
      end
    end
    
    WILD_CARDS.each { |joker| cards << Card.new(joker, 1) }
  end
  
  def remove_from_deck(card)
  end
  
  def shuffle_cards
    @cards.shuffle!
  end
end