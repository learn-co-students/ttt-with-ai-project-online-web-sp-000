class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9," ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i - 1
    @cells[input]
  end

  def full?
    @cells.none? {|cell| cell == " "}
  end

  def turn_count
    counter = 0
    @cells.each do |cell| if cell != " "
      counter += 1
      end
    end
    counter
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    input = input.to_i
    input.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    input = input.to_i - 1
    @cells[input] = "X"
  end

end
