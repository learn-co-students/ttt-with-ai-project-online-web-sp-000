class Board

  attr_accessor :cells


  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    board_index = user_input.to_i - 1
    @cells[board_index]
  end

  def full?
    if @cells.include?(" ")
      return false
    end
    return true
  end

  def turn_count
    @cells.select { |cell| cell == "X" || cell == "O"}.size
  end

  def taken?(user_input)
    board_index = user_input.to_i - 1
    if @cells[board_index] != " "
      return true
    end
    return false
  end

  def valid_move?(user_input)
    if (user_input.to_i > 0 && user_input.to_i < 10) && !taken?(user_input)
      return true
    end
    return false
  end

  def update(user_input, player)
    board_index = user_input.to_i - 1
    @cells[board_index] = player.token
  end

end
