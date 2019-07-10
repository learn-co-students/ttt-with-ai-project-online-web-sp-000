class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " "
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    
  end

  def position(user_input)
    index = user_input.to_i - 1
    cells[index]
  end

  def full?
    cells.none? {|value| value == " "} || false
    #alternative from walk-thru video
    # cells.all? {|character| character == "X" || character == "O"}
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    index = index.to_i - 1
    cells[index] == "X" || cells[index] == "O" ? true : false
  end

  def valid_move?(user_input)
    if (1..9).include?(user_input.to_i)
      !self.taken?(user_input)
    end
  end

  def update(position, player)
    index = position.to_i - 1
    cells[index] = player.token
  end
end