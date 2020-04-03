class Board
  attr_accessor :cells


  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    input = input.to_i
    cells[input - 1]
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input = input.to_i
    input.between?(1,9) && !taken?(input)
  end

  def full?
    cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count
    counter = 0
    cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
    return counter
  end

    def update(input, player)
      input = input.to_i
      cells[input -1] = player.token
    end
end
