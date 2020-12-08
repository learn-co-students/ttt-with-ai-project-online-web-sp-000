class Board
  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} "+"|"+" #{@cells[1]} "+"|"" #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} "+"|"+" #{@cells4]} "+"|"" #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} "+"|"+" #{@cells[7]} "+"|"" #{@cells[8]} "
  end

  def position(input)
    @cells[input]
  end

  def update(position, player)
    @cells[position]=player.token
  end

  def full?
    @cells.select{ |item| item != " " && !item.nil? && item != ""}.size == 9
  end

  def turn_count
    count = 0
    @cells.each do  |item|
      if !(item == " " || item == "" )
        count += 1
      end
    end
    count
  end

  def taken?(index)
    !(@cells[index].nil? || @cells[index] == " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !taken?(index)
  end

end
