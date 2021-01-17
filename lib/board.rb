class Board
  attr_accessor :cells

  @cells = []

  def initialize
    reset!
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

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    if @cells.any? {|cell| cell == false || cell == nil || cell == " "}
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
    @cells.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(index)
    if @cells[index.to_i - 1] == "X" || @cells[index.to_i - 1] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if !taken?(index) && (index.to_i - 1).between?(0,8)
      return true
    else
      return false
    end
  end

  def update(index, player)
    if valid_move?(index)
      @cells[index.to_i - 1] = player.token
    end
  end

end
