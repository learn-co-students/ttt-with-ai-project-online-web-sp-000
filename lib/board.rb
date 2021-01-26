
class Board

attr_accessor:cells 
  
  def initialize
    @cells = Array.new(9, " ")
  end
   
  def reset!
    @cells = Array.new(9, " ")    
  end


  def display
    puts " #{ @cells[0]} | #{ @cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(user_input) 
    index = user_input.to_i - 1 
    @cells[index]
  end
  
  
  def full?
    !@cells.any?{ |x| x=="" || x == " "}
  end
  
  def turn_count
    @cells.count {|player| player=="X" || player=="O"}
  end

  def taken?(user_input)
    index = user_input.to_i - 1
      @cells[index] != " "
  end

  def valid_move?(user_input)
    #binding.pry
    !taken?(user_input) && user_input.to_i.between?(1,9)
  end

  def update(user_input, player = "X")
    index = user_input.to_i - 1
    @cells[index] = player
    #binding.pry 
  end

end


 