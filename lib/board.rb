class Board
  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    if self.cells != nil
      self.cells.clear
    end
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} "+"|"+" #{@cells[1]} "+"|"+" #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} "+"|"+" #{@cells[4]} "+"|"+" #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} "+"|"+" #{@cells[7]} "+"|"+" #{@cells[8]} "
  end

  def position(input)
    index = input_to_index(input)
    self.cells[index]
  end

  def input_to_index(input)
    index = input.to_i
    index - 1
  end

  def update(position, player)
    index = input_to_index(position)
    @cells[index]=player.token
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

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !taken?(input)
  end

  def empty?
    found_item = self.cells.find { |item| item != " " && item != nil}
    if found_item == nil
      return true
    else
      return false
    end
  end

end
