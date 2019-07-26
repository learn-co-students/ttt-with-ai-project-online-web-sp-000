class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
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
    if index.between?(0,8)
      @cells[index]
    else
      nil
    end
  end
  
  def full?
    @cells.all? {|index| index == "X" || index == "O"}
  end
  
  def turn_count
    turn = 0
    @cells.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end
  
  def taken?(input)
    if position(input) == "X" || position(input) == "O"
     true 
     else
       false 
    end
  end
  
  def valid_move?(input)
    if taken?(input.to_i) == false && input.to_i.between?(1,9)
     true
      else
     false
    end
  end
  
  def update(input, player)
    if valid_move?(input) == true
       index = input.to_i - 1
        @cells[index] = player.token
     end
  end
end