class Board
  attr_accessor :board, :cells



  def initialize
    reset!
  end

  def reset!
      @cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts " -----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts " -----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    input = input.to_i
    cell = @cells[input - 1]
  end

  def full?
    cells.all? do |index|
      if index == "X" || index == "O"
        true
      else
        false
      end
    end
  end

  def turn_count
    count = 0
    cells.each do |cell|
      if (cell == "X" || cell == "O")
        count +=1
      end
    end
    count
  end

  def taken?(input)
    @cells[input.to_i - 1] != "" && @cells[input.to_i - 1] != " "
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(input, player)
    input = input.to_i
    cells[input - 1] = player.token
  end

end
