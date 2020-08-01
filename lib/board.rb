class Board
  attr_accessor :cells

  def reset!
    cells.replace([" ", " ", " ", " ", " ", " ", " ", " ", " "])
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(num)
    result = nil
    index = num.to_i - 1
    if cells[index] == "X"
      result = "X"
    elsif cells[index] == "O"
      result = "O"
    elsif cells[index] == " "
      result = " "
    end
  end

  def full?
    self.cells.all? {|player| player == "X" || player == "O"}
  end

  def turn_count
    num = 0
    self.cells.each {|player| player == "X" || player == "O" ? num += 1 : nil}
    num
  end

  def taken?(num)
    index = num.to_i - 1
    cells[index] == "X" || cells[index] == "O" ? true : false
  end

  def valid_move?(num)
    index = num.to_i - 1
    (0..8).include?(index) && !self.taken?(num) ? true : false
  end

  def update(num, player)
    index = num.to_i - 1
    self.cells[index] = player.token
  end
end
