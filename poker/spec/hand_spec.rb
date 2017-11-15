require 'hand'

describe Hand do
  let(:cards) { double("cards") }
  subject(:hand) { Hand.new(cards) }
  
  describe "#make_hand" do
    it "makes a 5 card hand" do
      allow(cards).to receive(:pop).with(5).and_return(Array.new(5))
      five_cards = hand.make_hand
      expect(five_cards.size).to eq(5)
    end
  end
  
  describe "#discard_from_hand" do
    it "delete whatever number that user wants to discard from hand"
      expect(player.hand.size)
  
  end
end