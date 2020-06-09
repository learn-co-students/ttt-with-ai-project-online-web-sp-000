class Board
  attr_accessor :cells
  CORNERS_NUMBERS=[1,3,7,9]

  def initialize
    reset!
  end

  def reset!
    @cells=Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(number)
    cells[number.to_i-1]
  end

  def update(number,player)
    cells[number.to_i-1]=player.token
  end

  def taken?(number)
    position(number)!=" "
  end

  def valid_move?(number)
    number.to_i.between?(1,9)&&!taken?(number)
  end

  def available_corners
    available_corners=CORNERS_NUMBERS.select {|corner_number| !taken?(corner_number)}
    if available_corners==[]
      nil
    end
    available_corners
  end

  def full?
    cells.all? {|cell| cell!=" "}
  end

  def turn_count
    cells.count {|cell| cell!=" "}
  end

end
