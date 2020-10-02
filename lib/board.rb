
require "pry"


class Board

    

    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")
    end

    def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  
  def position(input)
    cells[input.to_i - 1]
  end
    

     def reset!
        @cells = Array.new(9, " ")
end

def full?
    if @cells.any? {|index| index == nil || index == " "}
    #binding.pry
    return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
    @cells.each do |token|
    if token == "X" || token == "O"
      counter += 1
      ##binding.pry
    end
end
counter
end


def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

    def update(input,player="X")
       # binding.pry
       cells[input.to_i - 1] = player.token
    end
end
