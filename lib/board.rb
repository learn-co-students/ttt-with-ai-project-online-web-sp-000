class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " " + @cells[0] + " | " + @cells[1] + " | " + @cells[2] + " "
    puts "-----------"
    puts " " + @cells[3] + " | " + @cells[4] + " | " + @cells[5] + " "
    puts "-----------"
    puts " " + @cells[6] + " | " + @cells[7] + " | " + @cells[8] + " "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def count_taken_cells
    @cells.select { |cell| cell != " " }.length
  end

  def full?
    count_taken_cells == 9
  end

  def turn_count
    count_taken_cells
  end

  def taken?(position)
    @cells[position.to_i-1] != " "
  end


  def update(position, player)
    return @cells[position.to_i - 1] = player.token if valid_move?(position)
  end
  def valid_move?(position)
    position.to_i.between?(1,9) if !taken?(position)
  end
end
