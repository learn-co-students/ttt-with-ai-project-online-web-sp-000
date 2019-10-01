class Board
  
  attr_accessor :cells

  def reset
    @cells = [" "," ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  
  def initialize
    @cells
    reset
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts  "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def user_input 
    user_input = gets.chomp.to_i
  end
  
  def position
    position = user_input - 1
    if player_token == "X"
      @cells[position] = "X"
    else
      @cells[position] = "O"
  end
  
  def full?
    @cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    turn_count = 0
    @cells.each{|cell| if (cell == "X" || cell == "O") turn_count += 1}
    turn_count
  end
  
  def taken?
    if position == "X" || position == "O"
      true
    else 
      false
    end
  end
  
  def valid_move?
    if (user_input >= 1 && user_input <= 9) && taken? == false
      true
    else
      false
    end
  end
  
  def update
    if valid_move? == true && full? == false
      position
    else
      nil
    end
  end
  
end