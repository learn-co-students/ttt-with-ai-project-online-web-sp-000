class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    filled = @cells.select{|token| token == "X" || token == "O"}
    filled.size
  end

  def taken?(cell)
    position(cell) == " " ? false : true
  end

  def valid_move?(cell)
    if cell.to_i > 0 && cell.to_i < 10 && !taken?(cell)
      true
    else
      false
    end
  end

  def update(cell, player)
    if valid_move?(cell)
      position(cell) = player
    end
  end

end
