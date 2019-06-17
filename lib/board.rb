class Board

  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def taken?(input)
    self.position(input) != " " && self.position(input) != ""
  end

  def full?
    index = -1
    @cells.all? do |idx|
      index += 1
      taken?(index)
    end
  end

  def turn_count
    turn = 0
    @cells.each do |space|
      if space == "X" || space == "O"
        turn += 1
      end
    end
    turn
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end