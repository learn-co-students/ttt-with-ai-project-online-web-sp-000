class Board
  attr_accessor :cells, :board

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]} \n-----------\n #{cells[6]} | #{cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    position = (user_input.to_i - 1)
    cells[position]
  end

  def full?
    @cells.all? do |position|
      position == "X" || "O" && position != " "
    end
  end

  def turn_count
    count = 0
    cells.each do |cell|
      if cell == "X" || cell == "O"
        count +=1
      end
    end
    count
  end

  def taken?(move)
    if position(move) == "X" || position(move) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1,9) && !taken?(input)
      true
    else
      false
    end
  end

  def update(input, player)
    move = input.to_i - 1
    @cells[move] = player.token
  end

end
