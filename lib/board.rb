require 'pry'

class Board
  attr_accessor :cells

  def initialize
      self.cells = Array.new(9) {" "}
  end

  def reset!
    self.cells.clear
    self.cells = Array.new(9) {" "}
  end

  def display
    puts (" #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} ")
    puts ("-----------")
    puts (" #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} ")
    puts ("-----------")
    puts (" #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} ")
  end

  def position(user_input)
    user_input = user_input.to_i - 1
    self.cells[user_input]
  end

  def full?
    flag = true
    self.cells.each do |cell|
      if cell == " "
        flag = false
        break
      end
    end
    flag
  end

  def turn_count
    counter = 0
    self.cells.each do |cell|
      cell == " " ? next : counter += 1
    end
    counter
  end

  def taken?(move)
    if self.position(move) == "X" || self.position(move) == "O"
      true
    else
      false
    end
  end

  def update(move, player)
    i = move.to_i - 1
    self.cells[i] = player.token unless !valid_move?(move)
  end
  
  def valid_move?(move)
    if move > "0" && move <= "9"
      !taken?(move)
    else
      false
    end
  end
    
    def update(move, player)
      i = move.to_i - 1
      self.cells[i] = player.token unless !valid_move?(move)
    end
  
end
