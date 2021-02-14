class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
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
    player_input = user_input.to_i - 1 #gets the position on the board we want to fill
    return @cells[player_input]
  end

  def full?
    if @cells.any? { |entry| entry == " " }
      return false
    else
      return true
    end
  end

  def turn_count
    #returns the amount of turns based on the number of values in the cells
    @cells.count {|entry| entry == "X" || entry == "O"}
  end

  def taken?(user_input)
    player_input = user_input.to_i - 1
    if @cells[player_input]== "X" || @cells[player_input]== "O"
      return true
    else
      return false
    end
  end

  def valid_move?(user_input)
    player_input = user_input.to_i - 1
    if player_input >= 0 && player_input <= 8 && self.taken?(user_input) == false
      return true
    else
      return false
    end
  end

  def update(user_input, player)
    if self.valid_move?(user_input) == true
      player_input = user_input.to_i - 1
      @cells[player_input] = player.token
    end
  end

end
