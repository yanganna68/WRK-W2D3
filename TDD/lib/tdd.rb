class Array
  def my_uniq
    result = []
    
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end
  
  def my_twosum
    pairs =[]
    
    self.length.times do |idx1|
      ((idx1 + 1)...self.length).each do |idx2|
        pairs << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    pairs
  end
  
  def my_transpose
    result = []
    
    (0...self.length).each do |col|
      next_col = []

      (0...self.length).each do |row|
        next_col << self[row][col]
      end
      
      result << next_col
    end
  
    result
  end
  
  def stock_picker
    profit = []
    max_profit = 0

    (0...length).each do |i|
      (i...length).each do |j|
        current_profit = self[j] - self[i]

        if max_profit <= current_profit
          profit = [i, j] 
          max_profit = current_profit
        end
      end
    end

    profit
  end
end

class TowersOfHanoi
  DISPLAY = {
    1 => "  =  ",
    2 => " === ",
    3 => "=====",
    nil => "     "
  }
  
  attr_reader :towers

  def initialize
    @towers = make_towers
  end

  def make_towers
    [[1, 2, 3], [], []]
  end
  
  def move(start_tower, end_tower)
    if towers[end_tower].empty? || towers[start_tower].first < towers[end_tower].first
      towers[end_tower].unshift(towers[start_tower].shift)
    else
      raise JanoiError.new("STUPIDDDD JANOI IS IN CHINA")
    end
  end
  
  def won?
    winning = [1, 2, 3]
    towers[1] == winning || towers[2] == winning
  end
  
  def render
    (0...towers.size).each do |row|
      towers.each do |tower|
        print DISPLAY[tower[row]]
      end
      puts "\n"
    end
    
    (0...towers.size).each { |row_num| print "  #{row_num}  " }
    puts "\n"
  end
  
  def play
    puts "Hi come play and have fun!"
    until won?
      begin
        render
        puts "where do you want to move? format: start, end"
        from, to = gets.chomp.split(",").map(&:to_i)
        move(from, to)
      rescue JanoiError => error
        puts error.message
        retry
      end
    
    end
    
    puts "u did it"
  end
end


class JanoiError < StandardError
end

if __FILE__ ==$PROGRAM_NAME
  system("clear")
  TowersOfHanoi.new.play
end