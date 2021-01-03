require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

 def reset!
   @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    index_position = input_to_index(user_input)
    @cells[index_position]  #return index position of board cells
  end

  def input_to_index(user_input)
    index_position = user_input.to_i - 1 #subtract 1 from the user input to convert to index position
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    empty_cells = @cells.count(" ")
    turns = @cells.size - empty_cells
    turns
  end

  def taken?(user_input)
    position(user_input) == " " ? false : true
  end

  def valid_move?(user_input)
    !taken?(user_input) && user_input.to_i.between?(1,9) ? true : false
  end

  def update(user_input, player)
    @cells[input_to_index(user_input)] = player.token
  end

  def display_instructions
    puts "-------------------------------------------------------------------------------------------"
    puts "Instructions: on your turn, enter 1-9 to place your token on the corresponding space below:"
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts "First to three in a row wins! Good Luck!"
    puts "-------------------------------------------------------------------------------------------"
    puts " "
  end

end
