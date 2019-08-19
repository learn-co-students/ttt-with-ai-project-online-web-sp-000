class Board
  attr_accessor :cells

   def initialize
    self.reset!
  end

   def reset!

    self.cells = Array.new(9, " ")
  end

   def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

   def position (input)
    self.cells[input.to_i - 1]
  end

   def full?
    return false if self.cells.include?(" ")
    true
  end

   def turn_count
    count = 0
    self.cells.each {|cell| count += 1 if cell != " "}
    count
  end

   def taken? (position)
    return true if self.cells[position.to_i - 1] == "X" || self.cells[position.to_i - 1] == "O"
    false
  end

   def valid_move?(position)
    return true if !taken?(position) && (1..9).include?(position.to_i)
    false
  end

   def update (position, player)
    self.cells[position.to_i - 1] = player.token
  end

 end 