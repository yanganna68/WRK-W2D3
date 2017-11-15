require 'tdd'

describe '#my_uniq' do
  it 'removed duplicates from an array'do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end
  
  it 'doesnt alter input array' do
    array = [-1, 0, 2, -2, 1]
    array.my_uniq
    expect(array).to eq(array)
  end
end

describe 'my_twosum' do
  it 'finds the pairs that sum to zero' do
    expect([-1, 0, 2, -2, 1].my_twosum.sort).to eq([[0, 4], [2, 3]])
  end

  it 'checks if the pairs are sorted' do
    expect([-1, 0, 2, -2, 1].my_twosum).to eq([[0, 4], [2, 3]])
  end

  it 'doesnt alter input array' do
    array = [-1, 0, 2, -2, 1]
    array.my_twosum
    expect(array).to eq(array)
  end
end

describe '#my_transpose' do
  it 'swaps each row and column' do
    rows = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]
    
    cols = [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]
    
    expect(rows.my_transpose).to eq(cols)
  end
end

describe "#stock_picker" do
  stocks_1 = [15, 10, 35, 1, 30, 25]
  
  it 'returns the most profitable buy/sell days' do
    expect(stocks_1.stock_picker).to eq([3, 4])
  end
  
  stocks_2 = [15, 8, 7, 5, 1]
  
  it 'sells on the same day to avoid negative profit' do
    expect(stocks_2.stock_picker.uniq.size).to eq(1)
  end
  
  stocks_3 = []
  
  it "doesn't buy stocks if there's no stocks" do
    expect(stocks_3.stock_picker).to eq([])
  end
end

describe TowersOfHanoi do
  subject(:hanoi) { TowersOfHanoi.new }
  
  describe "#towers" do
    starting_towers = [[1, 2, 3], [], []]
    it "starts with all the pieces stacked on the first tower" do
      expect(hanoi.towers).to eq(starting_towers)
    end
  end
  
  describe "#move" do
    it "moves a small disc to an empty tower" do
      hanoi.move(0, 1)
      expect(hanoi.towers[0].size).to eq(2)
      expect(hanoi.towers[1].size).to eq(1)
      expect(hanoi.towers[2]).to be_empty
    end
    
    it "moves a small disc on top of a big disc" do
      first_move = hanoi.move(0, 1)
      second_move = hanoi.move(0, 2)
      third_move = hanoi.move(1, 2)
      
      expect(hanoi.towers[2]).to eq([1, 2])
      expect(hanoi.towers[1]).to be_empty
      expect(hanoi.towers[0]).to eq([3])
    end
    
    it "raise an error if try to move bigger disc on smaller disc" do
      first_move = hanoi.move(0, 1)
      second_move = hanoi.move(0, 2)

      expect {hanoi.move(2, 1)}.to raise_error(JanoiError)
    end
  end
  
  describe "#won?" do
    it "return false when the game is not won" do
      expect(hanoi.won?).to be_falsy
    end
      
    it "return true when the game is won" do
      first_move = hanoi.move(0, 1)
      second_move = hanoi.move(0, 2)
      third_move = hanoi.move(1, 2)
      fourth_move = hanoi.move(0, 1)
      fifth_move = hanoi.move(2, 0)
      sixth_move = hanoi.move(2, 1)
      seventh_move = hanoi.move(0, 1)
      
      expect(hanoi.won?).to be_truthy
    end
  end
  
end