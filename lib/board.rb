class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    board_line = "-----------"
    @cells.each_with_index do |item, index|
      case @cells[0] || @cells[3] || @cells[6]
      when @cells[0]
        puts " #{@cells[index]} | #{@cells[index + 1]} | #{@cells[index + 2]} "
        puts board_line
      when @cells[3]
        puts " #{@cells[index]} | #{@cells[index + 1]} | #{@cells[index + 2]} "
        puts board_line
      when @cells[6]
        puts " #{@cells[index]} | #{@cells[index + 1]} | #{@cells[index + 2]} "
      end
    end
  end

  def position(input)
      cells[input.to_i-1]
  end

  def turn_count
    count = 0
    @cells.each {|a| a.match(/\w/) ? count += 1 : count}
    count
  end

  def full?
    !@cells.include?(" ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def taken?(input)
    if @cells[input.to_i - 1].match(/\w/)
      true
    else
      false
    end
  end

  def update(input, player)
      cells[input.to_i-1] = player.token
  end

end
