class Board
  
  attr_accessor :cells
  
  @@all = []
  
  def initialize
    @cells = Array.new(9," ")
    @@all << self
  end 
  
  def self.all
    @@all 
  end 
  
  def reset!
    @cells = Array.new(9," ")
  end 
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(user_input)
    self.cells[user_input.to_i - 1]
  end 
  
  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"} ? true : false 
  end 
  
  def turn_count
    count = self.cells.filter{|cell| cell == "X" || cell == "O"}
    count.length
  end 
  
  def taken?(user_input)
    position(user_input) == "X" || position(user_input) == "O" ? true : false
  end 
  
  def valid_move?(user_input)
    taken?(user_input) == false && (1..9).include?(user_input.to_i) ? true : false
  end 
  
  def update(user_input, player)
    @cells[user_input.to_i - 1] = player.token 
  end 
  
end 