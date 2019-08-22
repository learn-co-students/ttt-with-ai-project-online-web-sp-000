class Board
  attr_accessor :cells

  def initialize
    self.cells = (Array.new(9, " "))
  end

  def reset!
    self.cells = (Array.new(9, " "))
  end

  def display #Prints the Board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    input = user_input
    self.cells[input.to_i-1]
  end


  def full?
    cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count #Returns the amount of turns
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
  end

  def valid_move?(position)
    !taken?(position) && position.to_i >0 && position.to_i <=9
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end

end
