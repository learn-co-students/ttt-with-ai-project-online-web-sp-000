class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "-----------"
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
   puts "-----------"
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
 end

 def position(input)
   #position takes in user input and returns the value of the board cell
   @cells[input.to_i-1]
 end

 def full?
   @cells.none? {|cell| cell == " "}
 end

 def turn_count
   @cells.count{|cell| cell == "X" || cell == "O"}
 end
 def taken?(input)
   #returns true if the position is X or O, input is a string 1 through 9
   position(input) == "X" || position(input) == "O"
 end

 def valid_move?(input)
   #string & 1-9
   !taken?(input) && input.to_i.between?(1,9)
 end
 def update(input, player) #change input 1-9 to match array 0-8
   @cells[input.to_i - 1] = player.token
  end

end
