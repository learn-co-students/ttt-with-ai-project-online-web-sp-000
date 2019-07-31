
class Board

  attr_accessor :cells

  def initialize
    # @board = board
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
    input_to_index = index.to_i - 1
    self.cells[input_to_index]
  end

  def full?
    self.cells.all? do |cell|
      if cell == "X" || cell ==  "O"
        true
      else
        false
      end
    end
  end

    def turn_count #return amount of turns based on cell value
      counter = 0
      self.cells.each do |cell|
        if cell != " "
        counter += 1
        end
      end
      counter
    end

    def taken?(input)
      !(position(input) == " " || position(input) == "")
    end

    def valid_move?(input)
      input.to_i.between?(1,9) && !taken?(input)
    end

    def update(input, player)
    cells[input.to_i-1] = player.token
    end

end
