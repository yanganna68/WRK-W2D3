class Card
  attr_reader :suite, :rank
  
  def initialize(suite, rank)
    @suite = suite
    @rank = rank
  end
end