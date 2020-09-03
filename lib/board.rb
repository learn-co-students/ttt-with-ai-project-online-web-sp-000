class Board 
  
attr_accessor :cells  
  
@cells = []

  
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
    @cells[user_input.to_i - 1]
  end

  def full?
   @cells.all? {|i| i == "X" || i == "O"}
  end
  
  def turn_count
   counter = 0
   @cells.each do |spaces|
      if spaces == "X" || spaces == "O"
         counter += 1
      end
   end
   counter
end
  
 def taken?(position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
  end
  
  def valid_move?(position)
    !(taken?(position))  && (0..9).include?(position.to_i - 1)
  end
  
  token = "O"
  
  def update(position, player)
      self.cells[position.to_i-1] = player.token
  end
  
end
