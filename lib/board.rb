class Board
  
  attr_accessor :cells
  
  @cells = []
  
  def initialize
    self.reset!
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  #displays current state of board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    i_input = input.to_i
    i_input -= 1
    @cells[i_input]
  end
  
  def update(pos, player)
    i_pos = pos.to_i
    i_pos -= 1
    @cells[i_pos] = player.token
  end
  
  def full?
    @cells.none? {|position| position == " "}
  end
  
  def turn_count
    turn_number = 0
    @cells.each do |turn| 
      if turn != " "
        turn_number += 1
      end
    end
    return turn_number
  end
  
  def taken?(cell)
    cell_pos = position(cell)
    if cell_pos == "X" || cell_pos == "O"
      return true
    else
      return false
    end
  end
  
  def valid_move?(cell)
    if taken?(cell) == false
      i_cell = cell.to_i
      if i_cell.between?(1, 9)
        true
      end
    end
  end
end