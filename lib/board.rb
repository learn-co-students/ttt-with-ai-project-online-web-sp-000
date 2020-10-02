# require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input) #returns the value of the board cell
    cells[input.to_i - 1]
  end

  def full? #returns true or false
    cells.all? {|space_taken| space_taken != " "}
  end

  def turn_count #returns amount of turns based on cell value
    num_turns = 0
    cells.each do |played|

      if played == "X" || played == "O"
    num_turns += 1
      end
    end
    num_turns
  end

  def taken?(input) #returns true if the position is X or O
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input) #returns true for user input between 1-9 that is not taken
    !taken?(input) && input.to_i.between?(1, 9)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end
