class Board
  
  attr_accessor :cells
  
  def cells=(cells)
    @cells = cells.to_a
  end
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(user_input)
    position = user_input.to_i
    position -= 1
    @cells[position]
  end
  
  def full? 
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end
  
  def turn_count
    @cells.count { |cell| cell != " " }
  end
  
  def taken?(user_input)
    cell = position(user_input)
    cell == "X" || cell == "O" ? true : false
  end
  
  def valid_move?(user_input)
    if user_input.to_i >= 1 && user_input.to_i <= 9
      cell = position(user_input)
      cell == " " ? true : false
    else 
      false 
    end
  end

  def update(user_input, player)
    position = user_input.to_i
    position -= 1
    @cells[position] = player.token
  end

end