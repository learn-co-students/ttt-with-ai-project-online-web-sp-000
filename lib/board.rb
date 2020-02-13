class Board
  attr_accessor :cells 
  def initialize
    reset! 
  end 
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " "," ", " "]
  end 
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  def position(space)
    idx = space.to_i - 1
    @cells[idx]
  end 
  def update(str, player)
    if(valid_move?(str))
      idx = str.to_i - 1 
      @cells[idx] = player.token 
    end 
  end 
  def token(token)
    #call token method on player in move method (???)
  end 
  def full?
    @cells.all? {|square| square != " "} 
  end 
  def turn_count
    @cells.count{|square| square != " " }
  end 
  def taken?(str)
    idx = position(str)
    idx != " "
  end 
  def valid_move?(str)
    num = str.to_i - 1 
    !taken?(str) && num.between?(0, 8)
  end 
end 