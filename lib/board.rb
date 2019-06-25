class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
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
    idx = index.to_i - 1
    if idx > -1 && idx < @cells.size
      @cells[idx]
    end
  end
  def full?
    @cells.all? {|i| i == "X" || i == "O"}
  end
  def valid_move?(index)
    idx = index.to_i - 1
    if idx > -1 && idx < 9 && !taken?(index)
      true
    else
      false
    end
  end
  def taken?(index)
    idx = index.to_i - 1
    if (@cells[idx] == "X" || @cells[idx] == "O")
      true
    elsif (@cells[idx] == " " || @cells[idx] == "" || @cells[idx] == nil)
      false
    end
  end
  def turn_count
    cnt = 0
    @cells.each do |pos|
      if (pos == "X" ) || (pos == "O" )
        cnt += 1
      end
    end
    cnt
  end
  def update(pos, player)
    idx = pos.to_i - 1
    @cells[idx] = player.token
  end
end
