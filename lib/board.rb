class Board
  attr_accessor :cells
  @cells = []

  def initialize
    reset!
  end

  def cells
    @cells
  end

  def reset!
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
    if @cells[input.to_i - 1]
      @cells[input.to_i - 1]
    end
  end

  def full?
    @cells.all? do|position|
      if position == "X" || position == "O"
        true
      end
    end
  end

  def turn_count
    @cells.count {|token| token == 'X' || token == 'O'}
  end

  def taken?(index)
    index = index.to_i - 1
    @cells[index] == "X" || @cells[index] == "O"
  end

  def valid_move?(index)
    index = index.to_i
    if index.between?(1, 9) && !taken?(index)
      true
    end
  end

  def update(cell, player)
    index = cell.to_i - 1
    @cells[index] = player.token
  end

end
