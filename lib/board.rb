class Board
  # has spaces
  attr_accessor :cells

  #starts with all empty spaces
  def initialize
    reset!
  end

  # can reset itself
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  # can display itself
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(move)
  	cells[move.to_i - 1]
  end

  # can update itself with a player's move
  def update(move, player)
    cells[move.to_i - 1] = player.token
  end

  # helper to check if a valid move (space is on board && empty)
  def valid_move?(move)
  	if !(move.to_i - 1).between?(0,8)
      puts "That space is not on the board."
  		false
  elsif taken?(move)
      puts "That space is already taken."
      false
  	else
      true
  	end
  end

  def taken?(move)
  	position(move) == "X" || position(move) == "O"
  end

  # can track number of spaces taken (moves taken)
  def turn_count
    cells.select{ |s| s == "X" || s == "O" }.count
  end

  # can track if it's full or not
  def full?
    !cells.any? { |s| s == " " }
  end
end
