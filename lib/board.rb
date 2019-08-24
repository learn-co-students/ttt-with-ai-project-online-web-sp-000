class Board
  attr_accessor :cells

  def initialize
    reset!()
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(string)
    position = convert_to_index(string)
    @cells[position]
  end

  def convert_to_index(string)
    string.to_i - 1
  end

  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
      turns =  @cells.select{|cell| cell != " "}
      turns.length
  end

  def taken?(position)
    placement = position(position)
    if placement == "X" || placement == "O"
      true
    else
      false
    end
  end

  def valid_move?(user_input)
    if taken?(user_input) != true
      if (1..9).include?(user_input.to_i)
        return true
      else
        false
      end
    end
  end

  def update(position, player)
    index_location = position.to_i - 1
    self.cells[index_location] = player.token
  end

end
